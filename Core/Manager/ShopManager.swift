//
//  ShopManager.swift
//  GinoTest
//
//  Created by Nazar Herych on 7/27/19.
//  Copyright © 2019 Nazar Herych. All rights reserved.
//

import Foundation

protocol ShopManager: ShopBuyable {
    
}

protocol ShopBuyable {
    
}

final class GinoShopManager: ShopManager {
    
    // MARK: - Properties
    
    private let databaseManager: DatabaseManager
    
    // MARK: - Constructor
    
    init(databaseManager: DatabaseManager) {
        self.databaseManager = databaseManager
    }
}
