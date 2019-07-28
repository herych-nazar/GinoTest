//
//  StepperView.swift
//  GinoTest
//
//  Created by Nazar Herych on 7/28/19.
//  Copyright © 2019 Nazar Herych. All rights reserved.
//

import UIKit

protocol StepperViewInterface {
    var delegate: StepperViewDelegate? { get set }
    
    func setStep(_ step: Int)
}

protocol StepperViewDelegate: class {
    func didChangeValue(_ value: Int)
}

final class StepperView: UIView, StepperViewInterface {
    
    // MARK: - Properties
    
    weak var delegate: StepperViewDelegate?
    
    private var stepCounter = 1 {
        didSet {
            if stepCounter <= 0 {
                stepCounter = 1
            }
            
            countLabel.text = String(stepCounter)
            delegate?.didChangeValue(stepCounter)
        }
    }
    
    // MARK: - Views
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    private lazy var plusButton: UIButton = {
        let button = UIButton()
        button.setImage(GinoIcon.plus.image, for: .normal)
        button.addTarget(self, action: #selector(incrementStep(_:)), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var countLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "1"
        
        return label
    }()
    
    private lazy var minusButton: UIButton = {
        let button = UIButton()
        button.setImage(GinoIcon.minus.image, for: .normal)
        button.addTarget(self, action: #selector(decrementStep(_:)), for: .touchUpInside)
        
        return button
    }()
    
    // MARK: - Constructor
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }
    
    // MARK: - Methods
    
    func setStep(_ step: Int) {
        stepCounter = step
    }
    
    private func setupViews() {
        addStackView()
    }
    
    @objc private func decrementStep(_ sender: UIButton) {
        stepCounter.decrement()
    }
    
    @objc private func incrementStep(_ sender: UIButton) {
        stepCounter.increment()
    }
}

// MARK: - Layout
extension StepperView {
    private func addStackView() {
        addSubview(stackView)
        
        stackView.layout { $0.constraint(to: self, offset: 0) }
        
        stackView.addArrangedSubview(minusButton)
        stackView.addArrangedSubview(countLabel)
        stackView.addArrangedSubview(plusButton)
    }
}

