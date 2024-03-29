//
//  CartPresenter.swift
//  GinoTest
//
//  Created by Nazar Herych on 7/27/19.
//  Copyright © 2019 Nazar Herych. All rights reserved.
//

import Foundation

protocol CartPresenter {
    var delegate: CartManagerDelegate? { get set }
    var view: CartView? { get set }
    var totalPrice: Double { get }
    
    func numberOfDressesInCart() -> Int
    func dressAt(_ indexPath: IndexPath) -> Dress
    func removeDress(_ dress: Dress)
    
    func buyAllDresses()
}

protocol CartView: class {
    func shouldShowSuccessMessage(_ message: String)
}

final class GinoCartPresenter: CartPresenter {
    
    // MARK: - Properties
    
    weak var view: CartView?
    private var cartManager: CartManager
    
    var delegate: CartManagerDelegate? {
        get { return cartManager.delegate }
        set { cartManager.delegate = newValue }
    }
    
    var totalPrice: Double {
        return cartManager
            .dressesInShoppingCart()
            .compactMap {
                guard let count = $0.orderCount else { return nil }
                return Double(count) * $0.dress.price }
            .reduce(0.0) { $0 + $1 }
    }
    
    // MARK: - Constructor
    
    init(_ cartManager: CartManager) {
        self.cartManager = cartManager
    }
    
    // MARK: - Methods
    
    func numberOfDressesInCart() -> Int {
        return cartManager.numberOfDressesInCart()
    }
    
    func dressAt(_ indexPath: IndexPath) -> Dress {
        return cartManager.dress(by: indexPath)
    }
    
    func removeDress(_ dress: Dress) {
        cartManager.removeFromCart(dress)
    }
    
    func buyAllDresses() {
        let dressCount = cartManager.totalDressCount()
        cartManager.buyAllDresses()
        view?.shouldShowSuccessMessage(formSuccessMassage(dressCount))
    }
    
    private func formSuccessMassage(_ dressCount: Int) -> String {
        return "You successfully have bought \(dressCount) dresses"
    }
}
