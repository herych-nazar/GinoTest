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
    
    // MARK: - Methods
    
    private func configureController() {
        setupViews()
        
        view.backgroundColor = .yellow
        navigationController?.pushViewController(presenter.makeDressResult(dressResult: DressFilterResult()), animated: true)
    }
    
    private func setupViews() {
        
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
}
