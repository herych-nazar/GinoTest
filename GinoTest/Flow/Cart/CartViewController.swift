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
    
    private var presenter: CartPresenter
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
        label.text = "Subtotal: $0.0"
        
        return label
    }()
    
    private lazy var checkoutButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont(name: "AvenirNext-Medium", size: 18)
        button.setTitle("Checkout", for: .normal)
        button.backgroundColor = GinoColor.green
        button.addTarget(self, action: #selector(checkout(_:)), for: .touchUpInside)
        
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        
        return button
    }()
    
    // MARK: - Constructor
    
    init(presenter: CartPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
        
        self.presenter.view = self
        self.presenter.delegate = self
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
    
    @objc private func checkout(_ sender: UIButton) {
        presenter.buyAllDresses()
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
        collectionView.register(ShoppingCartCell.self, forCellWithReuseIdentifier: cellId)
    }
    
    private func setupViews() {
        setupCheckoutButton()
        setupTotalLabel()
        setupCollectionView()
    }
    
    private func reloadTotal() {
        totalLabel.text = "Subtotal: $\(presenter.totalPrice)"
    }
}

// MARK: - UICollectionViewDataSource
extension CartViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.numberOfDressesInCart()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        
        if let dressCell = cell as? ShoppingCartCellInterface {
            dressCell.setDress(presenter.dressAt(indexPath))
            dressCell.delegate = self
        }
        
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension CartViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width * 0.9, height: 190)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 30
    }
}

// MARK: - GinoCartView
extension CartViewController: CartView {
    func shouldShowSuccessMessage(_ message: String) {
        let allert = UIAlertController(title: "Success", message: message, preferredStyle: .alert)
        allert.addAction(UIAlertAction(title: "Ok", style: .default))
        present(allert, animated: true)
    }
}

extension CartViewController: CartManagerDelegate {
    func shouldUpdate() {
        collectionView.reloadData()
        reloadTotal()
    }
}

// MARK: - ShoppingCartDelegate
extension CartViewController: ShoppingCartDelegate {
    func shoppingCart(_ shoppingCart: ShoppingCartCellInterface, didChangeCount order: Int) {
        shoppingCart.dress?.orderCount = order
        reloadTotal()
    }
    
    func didRemoveCartEntity(_ shoppingCart: ShoppingCartCellInterface) {
        if let dress = shoppingCart.dress {
            presenter.removeDress(dress)
            dress.orderCount = nil
        }
    }
}

// MARK: - Layout
extension CartViewController {
    private func setupCollectionView() {
        view.addSubview(collectionView)
        
        collectionView.layout {
            $0.constraint(to: view.safeAreaLayoutGuide, by: .leading(0),.top(0), .trailing(0))
            $0.bottom.constraint(to: totalLabel, by: .top(-10))
        }
    }
    
    private func setupTotalLabel() {
        view.addSubview(totalLabel)
        
        totalLabel.layout {
            $0.constraint(to: view, by: .leading(20), .trailing(-20))
            $0.bottom.constraint(to: checkoutButton, by: .top(-10))
        }
    }
    
    private func setupCheckoutButton() {
        view.addSubview(checkoutButton)
        
        checkoutButton.layout {
            $0.size(.height(50))
            $0.constraint(to: view.safeAreaLayoutGuide, by: .bottom(-20), .leading(50), .trailing(-50))
        }
    }
}
