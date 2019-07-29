//
//  GinoTextPicker.swift
//  GinoTest
//
//  Created by Nazar Herych on 7/28/19.
//  Copyright © 2019 Nazar Herych. All rights reserved.
//

import UIKit

protocol PickerLoadable {
    func loadData(_ data: [String]?)
    func setValue(_ data: String)
}

final class GinoTextPicker: UIView, GinoText, PickerLoadable {
    
    // MARK: - Properties
    
    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
    
    var value: String? {
        return valueTextField.text
    }
    
    weak var delegate: GinoTextDelegate?
    
    private var data: [String]? {
        didSet {  picker.reloadAllComponents() }
    }
    
    // MARK: - Views
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AvenirNext-Medium", size: 18)
        label.numberOfLines = 1
        label.textAlignment = .left
        label.textColor = .gray
        label.text = "Bust"
        
        return label
    }()
    
    private lazy var valueTextField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont(name: "AvenirNext-Medium", size: 18)
        textField.textColor = .darkGray
        textField.backgroundColor = .white
        
        textField.inputView = picker
        textField.inputAccessoryView = pickerToolbar
        
        textField.leftView = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 15, height: 0)))
        textField.leftViewMode = .always
        
        textField.layer.cornerRadius = 5
        textField.layer.masksToBounds = true
        
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 1
        
        return textField
    }()
    
    private lazy var pickerToolbar: UIToolbar = {
        let toolBar = UIToolbar()
        toolBar.tintColor = .gray
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(donePicker))
        
        toolBar.setItems([doneButton], animated: false)
        
        return toolBar
    }()
    
    private lazy var picker: UIPickerView = {
        let picker = UIPickerView()
        picker.delegate = self
        picker.dataSource = self
        
        return picker
    }()
    
    // MARK: - Constructor
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Action
    
    @objc private func donePicker() {
        valueTextField.resignFirstResponder()
        delegate?.ginoSelector(self, didChangeValue: valueTextField.text)
    }
    
    // MARK: - Methods
    
    func loadData(_ data: [String]?) {
        self.data = data
    }
    
    func setValue(_ data: String) {
        valueTextField.text = data
    }
    
    private func configureView() {
        setupViews()
    }
    
    private func setupViews() {
        setupTitleLabel()
        setupValueField()
    }
}

// MARK: - Layout
extension GinoTextPicker {
    private func setupTitleLabel() {
        addSubview(titleLabel)
        
        titleLabel.layout {
            $0.constraint(to: self, by: .leading(10), .trailing(-10), .top(5))
        }
    }
    
    private func setupValueField() {
        addSubview(valueTextField)
        
        valueTextField.layout {
            $0.size(.height(40))
            $0.top.constraint(to: titleLabel, by: .bottom(5))
            $0.constraint(to: self, by: .leading(0), .bottom(0), .trailing(0))
        }
    }
}

// MARK: - UIPickerViewDelegate, UIPickerViewDataSource
extension GinoTextPicker: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data?.count ?? 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return data?[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        valueTextField.text = data?[row]
    }
}
