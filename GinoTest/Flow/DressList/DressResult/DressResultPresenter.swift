//
//  DressResultPresenter.swift
//  GinoTest
//
//  Created by Nazar Herych on 7/27/19.
//  Copyright © 2019 Nazar Herych. All rights reserved.
//

import Foundation

protocol DressResultPresenter: DressResultCellDelegate {
    func numberOfResults() -> Int
    func dressResultAt(_ indexPath: IndexPath) -> Dress?
}

final class GinoDressResultPresenter: DressResultPresenter {
    
    // MARK: - Properties
    
    private let shopManager: ShopManager
    private let cartManager: CartAddable
    private let filterResult: DressFilterResult
    
    private lazy var data: [DressObject] = {
        return shopManager.loadDresses(filterResult)
    }()
    
    // MARK: - Constructor
    
    init(result: DressFilterResult,
         shopManager: ShopManager,
         cartManager: CartAddable) {
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

// MARK: - DressResultCellDelegate
extension GinoDressResultPresenter: DressResultCellDelegate {
    func didAddedToCart(_ dress: Dress) {
        if cartManager.didCartContain(dress) {
            cartManager.removeFromCart(dress)
            dress.orderCount = nil
        } else {
            dress.orderCount = 1 
            cartManager.addDress(dress)
        }
    }
}
