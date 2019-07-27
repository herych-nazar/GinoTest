//
//  CartPresenter.swift
//  GinoTest
//
//  Created by Nazar Herych on 7/27/19.
//  Copyright © 2019 Nazar Herych. All rights reserved.
//

import Foundation

protocol CartPresenter {
    
}

final class GinoCartPresenter: CartPresenter {
    
    // MARK: - Properties
    
    private let cartManager: CartManager
    
    // MARK: - Constructor
    
    init(_ cartManager: CartManager) {
        self.cartManager = cartManager
    }
    
}
