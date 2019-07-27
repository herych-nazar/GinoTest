//
//  CartManager.swift
//  GinoTest
//
//  Created by Nazar Herych on 7/27/19.
//  Copyright © 2019 Nazar Herych. All rights reserved.
//

import Foundation

protocol CartManager {
    
}

final class GinoCartManager: CartManager {
    
    // MARK: - Properties
    
    private let shop: ShopBuyable
    
    // MARK: - Constructor
    
    init(_ shop: ShopBuyable) {
        self.shop = shop
    }
}
