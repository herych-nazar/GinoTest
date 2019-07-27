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
    
    // MARK: - Views
    
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
    
    // MARK: - Constructor
    
    init(presenter: SizeCalculatorPresenter) {
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
    
    private func configureController() {
        setupViews()
        
        view.backgroundColor = .white
    }
    
    private func setupViews() {
        setupBustSelector()
        setupWaistSelector()
        setupHipsSelector()
    }
    
}

// MARK: - Extension
extension SizeCalculatorViewController {
    func setupBustSelector() {
        view.addSubview(bustSelector)
        
        bustSelector.layout {
            $0.constraint(to: view, by: .top(200), .leading(20), .trailing(-20))
        }
    }
    
    func setupWaistSelector() {
        view.addSubview(waistSelector)
        
        waistSelector.layout {
            $0.top.constraint(to: bustSelector, by: .bottom(20))
            $0.constraint(to: view, by: .leading(20), .trailing(-20))
        }
    }
    
    func setupHipsSelector() {
        view.addSubview(hipsSelector)
        
        hipsSelector.layout {
            $0.top.constraint(to: waistSelector, by: .bottom(20))
            $0.constraint(to: view, by: .leading(20), .trailing(-20))
        }
    }
}
