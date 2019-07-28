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
    
    func numberOfDressesInCart() -> Int
    func dressAt(_ indexPath: IndexPath) -> Dress
}

final class GinoCartPresenter: CartPresenter {
    
    // MARK: - Properties
    
    private var cartManager: CartManager
    
    var delegate: CartManagerDelegate? {
        get { return cartManager.delegate }
        set { cartManager.delegate = newValue }
    }
    
    // MARK: - Constructor
    
    init(_ cartManager: CartManager) {
        self.cartManager = cartManager
    }
    
    func numberOfDressesInCart() -> Int {
        return cartManager.dressesInShoppingCart().count
    }
    
    func dressAt(_ indexPath: IndexPath) -> Dress {
        return cartManager.dressesInShoppingCart()[indexPath.item]
    }
}
