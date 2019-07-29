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
    func dress(by indexPath: IndexPath) -> Dress
    func didCartContain(_ dress: Dress) -> Bool
    func removeFromCart(_ dress: Dress)
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
        delegate?.shouldUpdate()
    }
    
    func dressesInShoppingCart() -> [Dress] {
        return dresses
    }
    
    func dress(by indexPath: IndexPath) -> Dress {
        return dresses[indexPath.item]
    }
    
    func didCartContain(_ dress: Dress) -> Bool {
        return dresses.contains(where: { $0.isEqual(to: dress) })
    }
    
    func removeFromCart(_ dress: Dress) {
        dresses.removeAll { $0.isEqual(to: dress) }
        dress.orderCount = nil
        delegate?.shouldUpdate()
    }
}
