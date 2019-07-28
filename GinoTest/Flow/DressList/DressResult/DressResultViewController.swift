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
    private let cellId = "DressSearchCell"
    
    // MARK: - Views
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.delegate = self
        
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
        configureCollectionView()
        setupViews()
    }
    
    private func configureAppearance() {
        title = "Search results"
        view.backgroundColor = GinoColor.backgroung
    }
    
    private func configureCollectionView() {
        collectionView.register(DressResultCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    private func setupViews() {
        setupCollectionView()
    }
}

// MARK: - UICollectionViewDataSource
extension DressResultViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        
        if let dressCell = cell as? DressResultCellInterface {
            dressCell.setDress(DressModel(availability: .inStock, image: UIImage(named: "dress3")!, price: 1257.99, allColors: [.red, .black, .blue], description: "6219M - Sequinned Fabric"))
        }        
        
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension DressResultViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width * 0.9, height: 480)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 30
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
