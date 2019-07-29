//
//  CartManager.swift
//  GinoTest
//
//  Created by Nazar Herych on 7/27/19.
//  Copyright © 2019 Nazar Herych. All rights reserved.
//

import Foundation

protocol CartManager: CartAddable, CartManagerDataSource {
    var delegate: CartManagerDelegate? { get set }
    
    func buyAllDresses()
    func totalDressCount() -> Int
}

protocol CartAddable {
    func addDress(_ dress: Dress)
    func removeFromCart(_ dress: Dress)
    func didCartContain(_ dress: Dress) -> Bool
}

protocol CartManagerDataSource {
    func numberOfDressesInCart() -> Int
    func dressesInShoppingCart() -> [Dress]
    func dress(by indexPath: IndexPath) -> Dress
}

protocol CartManagerDelegate: class {
    func shouldUpdate()
}

final class GinoCartManager: CartManager {
    
    // MARK: - Properties
    
    weak var delegate: CartManagerDelegate?
    private let shop: ShopTill
    private var dresses = [Dress]()
    
    // MARK: - Constructor
    
    init(_ shop: ShopTill) {
        self.shop = shop
    }
    
    // MARK: - Methods
    
    func buyAllDresses() {
        dresses.forEach {
            shop.buyDress($0)
            removeFromCart($0)
        }
    }
    
    func totalDressCount() -> Int {
        return dresses.reduce(0, { $0 + ($1.orderCount ?? 0) })
    }
    
    func didCartContain(_ dress: Dress) -> Bool {
        return dresses.contains(where: { $0.isEqual(to: dress) })
    }
}

// MARK: - CartAddable
extension GinoCartManager {
    func addDress(_ dress: Dress) {
        dresses.append(dress)
        delegate?.shouldUpdate()
    }
    
    func removeFromCart(_ dress: Dress) {
        dress.orderCount = nil
        
        if let index = dresses.firstIndex(where: { $0.isEqual(to: dress) }) {
            dresses.remove(at: index)
            delegate?.shouldUpdate()
        }
    }
}

// MARK: - CartManagerDataSource
extension GinoCartManager {
    func numberOfDressesInCart() -> Int {
        return dresses.count
    }
    func dressesInShoppingCart() -> [Dress] {
        return dresses
    }
    
    func dress(by indexPath: IndexPath) -> Dress {
        return dresses[indexPath.item]
    }
}
