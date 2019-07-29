//
//  ShopManager.swift
//  GinoTest
//
//  Created by Nazar Herych on 7/27/19.
//  Copyright © 2019 Nazar Herych. All rights reserved.
//

import UIKit

protocol ShopManager: ShopTill, ShopSizes {
    func loadDresses(_ dressFilter: DressFilterResult) -> [DressObject]
}

protocol ShopSizes {
    func sizes() -> [SizeObject]
}

protocol ShopTill {
    func buyDress(_ dress: Dress)
}

final class GinoShopManager: ShopManager {
    
    // MARK: - Properties
    
    private let databaseManager: DatabaseManager
    
    // MARK: - Constructor
    
    init(databaseManager: DatabaseManager) {
        self.databaseManager = databaseManager
        generateData()
    }
    
    // MARK: - Methods
    
    func loadDresses(_ dressFilter: DressFilterResult) -> [DressObject] {
        return databaseManager
            .loadDresses(dressFilter.category)
            .filter { $0.storage.hasElementWith(dressFilter.color, size: dressFilter.size) }
    }
    
    func sizes() -> [SizeObject] {
        return databaseManager.loadSizes()
    }
    
    private func generateData() {
        databaseManager.deleteAllData()
        
        // Size
        GinoGenerator.shared.generateSizes().forEach {
            databaseManager.saveSize($0)
        }
        
        // Dress
        let sizes = databaseManager.loadSizes()
        GinoGenerator.shared.generateDress(sizes: sizes)
            .flatMap { $0 }
            .forEach {
              databaseManager.saveDress($0)
        }
    }
}

// MARK: - ShopBuyable
extension GinoShopManager {
    func buyDress(_ dress: Dress) {
        if let pack = dress.dress.storage.elementWhere(dress.color, size: dress.size) {
            databaseManager.updateDressCounter(pack, removedUnits: dress.orderCount ?? 0)
        }
    }
}
