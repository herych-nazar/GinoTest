//
//  DressResultPresenter.swift
//  GinoTest
//
//  Created by Nazar Herych on 7/27/19.
//  Copyright © 2019 Nazar Herych. All rights reserved.
//

import Foundation

protocol DressResultPresenter {
    
}

final class GinoDressResultPresenter: DressResultPresenter {
    
    // MARK: - Properties
    
    private let shopManager: ShopManager
    private let cartManager: CartManager
    
    private let filterResult: DressFilterResult
    
    // MARK: - Constructor
    
    init(result: DressFilterResult,
         shopManager: ShopManager,
         cartManager: CartManager) {
        self.filterResult = result
        self.shopManager = shopManager
        self.cartManager = cartManager
    }
}
