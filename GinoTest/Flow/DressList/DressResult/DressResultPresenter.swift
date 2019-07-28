//
//  DressResultPresenter.swift
//  GinoTest
//
//  Created by Nazar Herych on 7/27/19.
//  Copyright © 2019 Nazar Herych. All rights reserved.
//

import Foundation

protocol DressResultPresenter {
    func numberOfResults() -> Int
    func dressResultAt(_ indexPath: IndexPath) -> Dress?
}

final class GinoDressResultPresenter: DressResultPresenter {
    
    // MARK: - Properties
    
    private let shopManager: ShopManager
    private let cartManager: CartManager
    
    private let filterResult: DressFilterResult
    
    private lazy var data: [DressObject] = {
        return shopManager.loadDresses(filterResult)
    }()
    
    // MARK: - Constructor
    
    init(result: DressFilterResult,
         shopManager: ShopManager,
         cartManager: CartManager) {
        self.filterResult = result
        self.shopManager = shopManager
        self.cartManager = cartManager
        
        print(shopManager.loadDresses(filterResult))
    }
    
    // MARK: - Methods
    
    func numberOfResults() -> Int {
        return data.count
    }
    
    func dressResultAt(_ indexPath: IndexPath) -> Dress? {
        return data[indexPath.item].toDress(filterResult)
    }
}
