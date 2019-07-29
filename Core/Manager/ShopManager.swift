//
//  ShopManager.swift
//  GinoTest
//
//  Created by Nazar Herych on 7/27/19.
//  Copyright © 2019 Nazar Herych. All rights reserved.
//

import UIKit

protocol ShopManager: ShopBuyable {
    func loadDresses(_ dressFilter: DressFilterResult) -> [DressObject]
    func loadSizes() -> [SizeObject]
}

protocol ShopBuyable {
    
}

final class GinoShopManager: ShopManager {
    
    // MARK: - Properties
    
    private let databaseManager: DatabaseManager
    
    // MARK: - Constructor
    
    init(databaseManager: DatabaseManager) {
        self.databaseManager = databaseManager
        generateData()
    }
    
    func loadDresses(_ dressFilter: DressFilterResult) -> [DressObject] {
        return databaseManager
            .loadDresses(dressFilter.category)
            .filter { $0.storage.hasElementWith(dressFilter.color, size: dressFilter.size) }
    }
    
    func loadSizes() -> [SizeObject] {
        return databaseManager.loadSizes()
    }
    
    private func generateData() {
        databaseManager.deleteAllData()
        
        // Size
        GinoGenerator.shared.generateSizes().forEach {
            databaseManager.saveSize($0)
        }
        
        // Dress
        guard let size = databaseManager.loadSize(.m) else { return }
        ["2128H - Tulle", "2835C - Lace", "3018B - Lace", "3032H - Crepe"].forEach {
            if let dress = GinoGenerator.shared.generateDress(name: $0, size: size) {
                databaseManager.saveDress(dress)
            }
        }
        
        
    }
}
