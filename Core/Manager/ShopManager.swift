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
        
        
//        let size = SizeObject(value: ["name": DressSize.m.rawValue, "bust": 89, "waist": 76, "hips": 93])
//        let dressPack = DressPack(value: ["size": databaseManager.loadSize(.m),
//                                          "count": 3, "color": DressColor.blue.rawValue,
//                                          "status": Availability.inPoduction.description])
//
//        let dress = DressObject(value: ["name": "7130S - Satin", "category": DressCategory.lenoviaBridal.rawValue,
//                                        "price": 121.0,
//                                        "storage": [dressPack],
//                                        "image": UIImage(named: "dress3")?.pngData()])
//
//        databaseManager.saveDress(dress)
        
//        print(databaseManager.loadDresses())
    }
    
    func loadDresses(_ dressFilter: DressFilterResult) -> [DressObject] {
        return databaseManager
            .loadDresses(dressFilter.category)
            .filter { $0.storage.hasElementWith(dressFilter.color, size: dressFilter.size) }
    }
    
    func loadSizes() -> [SizeObject] {
        return databaseManager.loadSizes()
    }
}
