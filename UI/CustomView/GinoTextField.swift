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
    var value: Int? { get }
    var delegate: GinoTextFieldDelegate? { get set }
}

protocol GinoTextFieldDelegate: class {
    func ginoSelector(_ selector: GinoTextField, didChangeValue value: String?)
}

final class GinoTextField: UIView, GinoText {
    

    // MARK: - Properties
    
    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
    
    var value: Int? {
        guard let text = valueTextField.text else { return nil }
        return Int(text)
    }
    
    weak var delegate: GinoTextFieldDelegate?
    
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
//        textField.keyboardType = .asciiCapableNumberPad
        textField.delegate = self
        
        textField.layer.cornerRadius = 5
        textField.layer.masksToBounds = true
        
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 1
        
        return textField
    }()
    
    // MARK: - Constructor

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
    
    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        let invalid = CharacterSet(charactersIn: "1234567890")
        if string.rangeOfCharacter(from: invalid) != nil {
            return true
        }
        
        return false
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
