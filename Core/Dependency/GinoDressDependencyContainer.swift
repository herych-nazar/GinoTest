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
    
    func makeSizeCalculatorViewController(delegate: SizeCalculatorDelegate? = nil) -> UIViewController {
        let presenter = GinoSizeCalculatorPresenter(shopSizes: sharedShopManager, delegate: delegate)
        return SizeCalculatorViewController(presenter: presenter)
    }
    
    func makeDressResultViewController(filterResult: DressFilterResult) -> UIViewController {
        let presenter = GinoDressResultPresenter(result: filterResult,
                                                 shopManager: sharedShopManager,
                                                 cartManager: sharedCartManager)
        return DressResultViewController(presenter: presenter)
    }
}
