//
//  SizeCalculatorViewController.swift
//  GinoTest
//
//  Created by Nazar Herych on 7/27/19.
//  Copyright © 2019 Nazar Herych. All rights reserved.
//

import UIKit

final class SizeCalculatorViewController: UIViewController {

    // MARK: Properties
    
    private let presenter: SizeCalculatorPresenter
    
    private var size: Any?
    
    // MARK: - Views
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.alwaysBounceVertical = true
        
        return scrollView
    }()
    
    //
    private lazy var bustSelector: GinoTextField = {
        let selector = GinoTextField()
        selector.title = "Bust"
        
        return selector
    }()
    
    private lazy var waistSelector: GinoTextField = {
        let selector = GinoTextField()
        selector.title = "Waist"
        
        return selector
    }()
    
    private lazy var hipsSelector: GinoTextField = {
        let selector = GinoTextField()
        selector.title = "Hips"
        
        return selector
    }()
    
    //
    private lazy var calculateButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont(name: "AvenirNext-Medium", size: 18)
        button.setTitle("CALCULATE", for: .normal)
        button.backgroundColor = GinoColor.green
        button.addTarget(self, action: #selector(calculateSize(_:)), for: .touchUpInside)
        
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        
        return button
    }()
    
    //
    private lazy var resultStack: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.isHidden = true
        
        return stackView
    }()
    
    private lazy var resultLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AvenirNext-Medium", size: 18)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = .gray
        label.text = "nil"
        
        return label
    }()
    
    private lazy var useSizeButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont(name: "AvenirNext-Medium", size: 18)
        button.setTitle("USE SIZE", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.addTarget(self, action: #selector(saveSize(_:)), for: .touchUpInside)
        
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        
        button.layer.borderWidth = 1
        button.layer.borderColor = GinoColor.green.cgColor
        
        return button
    }()
    
    // MARK: - Constructor
    
    init(presenter: SizeCalculatorPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        
        presenter.view = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureController()
        
    }
    
    // MARK: - Action
    @objc private func calculateSize(_ sender: UIButton) {
        if let bust = bustSelector.value,
            let waist = waistSelector.value,
            let hips = hipsSelector.value {
            presenter.processNewSize(bust: bust, waist: waist, hips: hips)
        }
    }
    
    @objc private func saveSize(_ sender: UIButton) {
        if let size = size {
            presenter.saveSize(size)
        }
    }
    
    // MARK: - Methods
    
    private func configureController() {
        title = "Size Calculator"
        view.backgroundColor = GinoColor.backgroung
        setupViews()
    }
    
    private func setupViews() {
        setupScrollView()
        setupBustSelector()
        setupWaistSelector()
        setupHipsSelector()
        setupCalculateButton()
        setupResultStack()
    }
    
}

// MARK: - SizeCalculatorView
extension SizeCalculatorViewController: SizeCalculatorView {
    func updateResult(_ result: SizeResul) {
        resultStack.isHidden = false
        resultLabel.text = result.description
        size = result.value
    }
}

// MARK: - Extension
extension SizeCalculatorViewController {
    private func setupScrollView() {
        view.addSubview(scrollView)
        
        scrollView.layout {
            $0.constraint(to: view.safeAreaLayoutGuide, offset: 0)
        }
    }
    
    private func setupBustSelector() {
        scrollView.addSubview(bustSelector)
        
        bustSelector.layout {
            $0.top.constraint(to: scrollView, by: .top(50))
            $0.constraint(to: view, by: .leading(20), .trailing(-20))
        }
    }
    
    private func setupWaistSelector() {
        scrollView.addSubview(waistSelector)
        
        waistSelector.layout {
            $0.top.constraint(to: bustSelector, by: .bottom(20))
            $0.constraint(to: view, by: .leading(20), .trailing(-20))
        }
    }
    
    private func setupHipsSelector() {
        scrollView.addSubview(hipsSelector)
        
        hipsSelector.layout {
            $0.top.constraint(to: waistSelector, by: .bottom(20))
            $0.constraint(to: view, by: .leading(20), .trailing(-20))
        }
    }
    
    private func setupCalculateButton() {
        scrollView.addSubview(calculateButton)
        
        calculateButton.layout {
            $0.size(.height(50))
            $0.top.constraint(to: hipsSelector, by: .bottom(30))
            $0.constraint(to: view, by: .leading(50), .trailing(-50))
        }
    }
    
    private func setupResultStack() {
        scrollView.addSubview(resultStack)
        
        resultStack.addArrangedSubview(resultLabel)
        resultStack.addArrangedSubview(useSizeButton)
        
        resultStack.layout {
            $0.top.constraint(to: calculateButton, by: .bottom(40))
            $0.constraint(to: view, by: .leading(20), .trailing(-20))
            $0.bottom.constraint(to: scrollView, by: .bottom(-60))
        }
        
        useSizeButton.layout { $0.size(.width(100), .height(40)) }
    }
}
