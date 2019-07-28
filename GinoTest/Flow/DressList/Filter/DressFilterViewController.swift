//
//  DressFilterViewController.swift
//  GinoTest
//
//  Created by Nazar Herych on 7/27/19.
//  Copyright © 2019 Nazar Herych. All rights reserved.
//

import UIKit

final class DressFilterViewController: UIViewController {

    // MARK: Properties
    
    private let presenter: DressFilterPresenter
    
    // MARK: - Views
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.alwaysBounceVertical = true
        
        return scrollView
    }()
    
    private lazy var colorPicker: GinoTextPicker = {
        let selector = GinoTextPicker()
        selector.title = "Color"
        
        return selector
    }()
    
    private lazy var collectionPicker: GinoTextPicker = {
        let selector = GinoTextPicker()
        selector.title = "Colection"
        
        return selector
    }()
    
    private lazy var sizePicker: GinoTextPicker = {
        let selector = GinoTextPicker()
        selector.title = "Size"
        
        return selector
    }()
    
    private lazy var applyButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont(name: "AvenirNext-Medium", size: 18)
        button.setTitle("Apply", for: .normal)
        //        button.backgroundColor = GinoColor.green
        
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        
        return button
    }()
    
    private lazy var whatSizeButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont(name: "AvenirNext-Medium", size: 18)
        button.setTitle("WHATS MY SIZE?", for: .normal)
        //        button.backgroundColor = GinoColor.green
        
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        
        return button
    }()
    
    // MARK: - Constructor
    
    init(presenter: DressFilterPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
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
    
    @objc private func donePicker() {
        colorPicker.resignFirstResponder()
    }
    
    // MARK: - Methods
    
    private func configureController() {
        setupViews()
        
        view.backgroundColor = .yellow
        navigationController?.pushViewController(presenter.makeSizeCalculator(), animated: true)
    }
    
    private func setupViews() {
        setupScrollView()
        setupColorPicker()
        setupCollectionPicker()
        setupSizePicker()
        setupApplyButton()
        setupWhatSizeButton()
    }

}

// MARK: - Layout views
extension DressFilterViewController {
    private func setupScrollView() {
        view.addSubview(scrollView)
        
        scrollView.layout {
            $0.constraint(to: view.safeAreaLayoutGuide, offset: 0)
        }
    }
    
    private func setupColorPicker() {
        view.addSubview(colorPicker)
        
        colorPicker.layout {
            $0.top.constraint(to: scrollView, by: .top(20))
            $0.constraint(to: view, by: .leading(20), .trailing(-20))
        }
    }
    
    private func setupCollectionPicker() {
        view.addSubview(collectionPicker)
        
        collectionPicker.layout {
            $0.top.constraint(to: colorPicker, by: .bottom(20))
            $0.constraint(to: view, by: .leading(20), .trailing(-20))
        }
    }
    
    private func setupSizePicker() {
        view.addSubview(sizePicker)
        
        sizePicker.layout {
            $0.top.constraint(to: collectionPicker, by: .bottom(20))
            $0.constraint(to: view, by: .leading(20), .trailing(-20))
        }
    }
    
    
    
    private func setupApplyButton() {
        scrollView.addSubview(applyButton)
        
        applyButton.layout {
            $0.size(.height(50))
            $0.top.constraint(to: sizePicker, by: .bottom(30))
            $0.constraint(to: view, by: .leading(40), .trailing(-40))
        }
    }
    
    private func setupWhatSizeButton() {
        scrollView.addSubview(whatSizeButton)
        
        whatSizeButton.layout {
            $0.size(.height(80))
            $0.top.constraint(to: applyButton, by: .bottom(50))
            $0.constraint(to: view, by: .leading(40), .trailing(-40))
            $0.bottom.constraint(to: scrollView, by: .bottom(0))
        }
    }
}
