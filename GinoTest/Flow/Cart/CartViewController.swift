//
//  CartViewController.swift
//  GinoTest
//
//  Created by Nazar Herych on 7/27/19.
//  Copyright © 2019 Nazar Herych. All rights reserved.
//

import UIKit

final class CartViewController: UIViewController {

    // MARK: Properties
    
    private let presenter: CartPresenter
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
    
    private lazy var totalLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AvenirNext-Medium", size: 16)
        label.numberOfLines = 1
        label.textAlignment = .center
        label.textColor = .black
        label.text = "Subtotal: $1241.0"
        
        return label
    }()
    
    private lazy var checkoutButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont(name: "AvenirNext-Medium", size: 18)
        button.setTitle("Checkout", for: .normal)
        button.backgroundColor = GinoColor.green
        
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        
        return button
    }()
    
    // MARK: - Constructor
    
    init(presenter: CartPresenter) {
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
        title = "Shopping cart"
        view.backgroundColor = GinoColor.backgroung
    }
    
    private func configureCollectionView() {
        collectionView.register(DressResultCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    private func setupViews() {
        setupCheckoutButton()
        setupTotalLabel()
        setupCollectionView()
    }

}

// MARK: - UICollectionViewDataSource
extension CartViewController: UICollectionViewDataSource {
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
extension CartViewController: UICollectionViewDelegateFlowLayout {
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
extension CartViewController {
    private func setupCollectionView() {
        view.addSubview(collectionView)
        
        collectionView.layout {
            $0.constraint(to: view.safeAreaLayoutGuide, by: .leading(0),.top(0), .trailing(0))
            $0.bottom.constraint(to: totalLabel, by: .top(-20))
        }
    }
    
    private func setupTotalLabel() {
        view.addSubview(totalLabel)
        
        totalLabel.layout {
            $0.constraint(to: view, by: .leading(20), .trailing(-20))
            $0.bottom.constraint(to: checkoutButton, by: .top(-20))
        }
    }
    
    private func setupCheckoutButton() {
        view.addSubview(checkoutButton)
        
        checkoutButton.layout {
            $0.size(.height(50))
            $0.constraint(to: view.safeAreaLayoutGuide, by: .bottom(-30), .leading(50), .trailing(-50))
        }
    }
}
