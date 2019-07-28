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
    
    private lazy var categoryPicker: GinoTextPicker = {
        let selector = GinoTextPicker()
        selector.title = "Category"
        selector.loadData(presenter.dressCollections)
        
        return selector
    }()
    
    private lazy var colorPicker: GinoTextPicker = {
        let selector = GinoTextPicker()
        selector.title = "Color"
        selector.loadData(presenter.dressColors)
        
        return selector
    }()
    
    private lazy var sizePicker: GinoTextPicker = {
        let selector = GinoTextPicker()
        selector.title = "Size"
        selector.loadData(presenter.dressSizes)
        
        return selector
    }()
    
    private lazy var applyButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont(name: "AvenirNext-Medium", size: 18)
        button.setTitle("Apply", for: .normal)
        button.backgroundColor = GinoColor.green
        button.addTarget(self, action: #selector(applyFilter), for: .touchUpInside)
        
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        
        return button
    }()
    
    private lazy var whatSizeButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont(name: "AvenirNext-Medium", size: 18)
        button.setTitle("WHATS MY SIZE?", for: .normal)
        button.backgroundColor = GinoColor.mint
        button.setTitleColor(.gray, for: .normal)
        button.addTarget(self, action: #selector(calculateSize), for: .touchUpInside)
        
        button.layer.maskedCorners = .layerMinXMinYCorner
        button.layer.cornerRadius = 40
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
    
    @objc private func applyFilter() {
        if let dressFilter = formDressFilterResult() {
            let controller = presenter.makeDressResult(dressResult: dressFilter)
            navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    @objc private func calculateSize() {
        let controller = presenter.makeSizeCalculator()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    // MARK: - Methods
    
    private func configureController() {
        configureAppearance()
        setupViews()
    }
    
    private func configureAppearance() {
        title = "Filter dress"
        view.backgroundColor = GinoColor.backgroung
    }
    
    private func setupViews() {
        setupScrollView()
        setupCategoryPicker()
        setupColorPicker()
        setupSizePicker()
        setupApplyButton()
        setupWhatSizeButton()
    }

    private func formDressFilterResult() -> DressFilterResult? {
        guard let category = categoryPicker.value?.toDressCategory(),
            let color = colorPicker.value?.toDressColor(),
            let size = sizePicker.value?.toDressSize() else {
                return nil
        }
        
        return DressFilterResult(category: category, color: color, size: size)
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
    
    private func setupCategoryPicker() {
        view.addSubview(categoryPicker)
        
        categoryPicker.layout {
            $0.top.constraint(to: scrollView, by: .top(50))
            $0.constraint(to: view, by: .leading(20), .trailing(-20))
        }
    }
    
    private func setupColorPicker() {
        view.addSubview(colorPicker)
        
        colorPicker.layout {
            $0.top.constraint(to: categoryPicker, by: .bottom(20))
            $0.constraint(to: view, by: .leading(20), .trailing(-20))
        }
    }
    
    private func setupSizePicker() {
        view.addSubview(sizePicker)
        
        sizePicker.layout {
            $0.top.constraint(to: colorPicker, by: .bottom(20))
            $0.constraint(to: view, by: .leading(20), .trailing(-20))
        }
    }
    
    private func setupApplyButton() {
        scrollView.addSubview(applyButton)
        
        applyButton.layout {
            $0.size(.height(50))
            $0.top.constraint(to: sizePicker, by: .bottom(40))
            $0.constraint(to: view, by: .leading(40), .trailing(-40))
            $0.bottom.constraint(to: scrollView, by: .bottom(0))
        }
    }
    
    private func setupWhatSizeButton() {
        view.addSubview(whatSizeButton)
        
        whatSizeButton.layout {
            $0.size(.height(80), .width(270))
            $0.constraint(to: view, by: .trailing(0))
            $0.bottom.constraint(to: view.safeAreaLayoutGuide, by: .bottom(0))
        }
    }
}
