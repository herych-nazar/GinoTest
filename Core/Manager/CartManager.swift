//
//  CartManager.swift
//  GinoTest
//
//  Created by Nazar Herych on 7/27/19.
//  Copyright © 2019 Nazar Herych. All rights reserved.
//

import Foundation

protocol CartManager {
    var delegate: CartManagerDelegate? { get set }
    
    func addDress(_ dress: Dress)
    func dressesInShoppingCart() -> [Dress]
}

protocol CartManagerDelegate: class {
    func shouldUpdate()
}

final class GinoCartManager: CartManager {
    
    // MARK: - Properties
    
    weak var delegate: CartManagerDelegate?
    
    private let shop: ShopBuyable
    private var dresses = [Dress]()
    
    // MARK: - Constructor
    
    init(_ shop: ShopBuyable) {
        self.shop = shop
    }
    
    // MARK: - Methods
    
    func addDress(_ dress: Dress) {
        dresses.append(dress)
    }
    
    func dressesInShoppingCart() -> [Dress] {
        return dresses
    }
}
