//
//  GinoSelector.swift
//  GinoTest
//
//  Created by Nazar Herych on 7/27/19.
//  Copyright © 2019 Nazar Herych. All rights reserved.
//

import UIKit

protocol GinoText {
    var title: String? { get set }
    var value: String? { get }
    var delegate: GinoTextDelegate? { get set }
}

protocol GinoTextDelegate: class {
    func ginoSelector(_ selector: GinoText, didChangeValue value: String?)
}

final class GinoTextField: UIView, GinoText {
    
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
        textField.keyboardType = .numberPad
        textField.inputAccessoryView = toolBar
        textField.delegate = self
        
        textField.leftView = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 15, height: 0)))
        textField.leftViewMode = .always
        
        textField.layer.cornerRadius = 5
        textField.layer.masksToBounds = true
        
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 1
        
        return textField
    }()
    
    private lazy var toolBar: UIToolbar = {
        let toolBar = UIToolbar()
        toolBar.tintColor = .gray
        toolBar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneKeyboard))
        toolBar.setItems([doneButton], animated: false)
        
        return toolBar
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
    
    @objc private func doneKeyboard() {
        valueTextField.resignFirstResponder()
    }
    
    // MARK: - Methods
    
    private func configureView() {
        setupViews()
    }
    
    private func setupViews() {
        setupTitleLabel()
        setupValueField()
    }
    
}


extension GinoTextField {
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

// MARK: - UITextFieldDelegate
extension GinoTextField: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder();
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        delegate?.ginoSelector(self, didChangeValue: textField.text)
    }
}
