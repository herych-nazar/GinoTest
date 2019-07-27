//
//  GinoDressDependencyContainer.swift
//  GinoTest
//
//  Created by Nazar Herych on 7/27/19.
//  Copyright © 2019 Nazar Herych. All rights reserved.
//

import UIKit

final class GinoDressDependencyContainer {
    
    // MARK: - Properties
    
    let sharedShopManager: ShopManager
    let sharedCartManager: CartManager
    
    // MARK: - Constructor
    
    init(appContainer:  GinoAppDependencyContainer) {
        sharedShopManager = appContainer.sharedShopManager
        sharedCartManager = appContainer.sharedCartManager
    }
    
    // MARK: - Methods
    func makeSizeCalculatorViewController() -> UIViewController {
        return SizeCalculatorViewController(presenter: GinoSizeCalculatorPresenter())
    }
    
    func makeDressResultViewController() -> UIViewController {
        return DressResultViewController(presenter: GinoDressResultPresenter())
    }
}
