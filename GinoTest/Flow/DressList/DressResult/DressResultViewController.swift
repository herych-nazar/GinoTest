//
//  DressResultViewController.swift
//  GinoTest
//
//  Created by Nazar Herych on 7/27/19.
//  Copyright © 2019 Nazar Herych. All rights reserved.
//

import UIKit

final class DressResultViewController: UIViewController {

    // MARK: Properties
    
    private let presenter: DressResultPresenter
    
    // MARK: - Views
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .green
        
        return collectionView
    }()
    
    // MARK: - Constructor
    
    init(presenter: DressResultPresenter) {
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
        configureAppearance()
        setupViews()
    }
    
    private func configureAppearance() {
        title = "Search results"
        view.backgroundColor = GinoColor.backgroung
    }
    
    private func setupViews() {
        setupCollectionView()
    }
}

// MARK: - Layout
extension DressResultViewController {
    private func setupCollectionView() {
        view.addSubview(collectionView)
        
        collectionView.layout {
            $0.constraint(to: view.safeAreaLayoutGuide, offset: 0)
        }
    }
}
