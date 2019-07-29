//
//  GinoAppDependencyContainer.swift
//  GinoTest
//
//  Created by Nazar Herych on 7/27/19.
//  Copyright © 2019 Nazar Herych. All rights reserved.
//

import UIKit

final class GinoAppDependencyContainer {
    
    // MARK: - Properties
    
    let sharedDatabaseManager: DatabaseManager
    let sharedShopManager: ShopManager
    let sharedCartManager: CartManager
    
    // MARK: - Constructor
    
    init() {
        func makeDatabaseManager() -> DatabaseManager {
            return GinoDatabaseManager()
        }
        
        func makeShopManager(_ databaseManager: DatabaseManager) -> ShopManager {
            return GinoShopManager(databaseManager: databaseManager)
        }
        
        func makeCartManager(_ shop: ShopTill) -> CartManager {
            return GinoCartManager(shop)
        }
        
        sharedDatabaseManager = makeDatabaseManager()
        sharedShopManager = makeShopManager(sharedDatabaseManager)
        sharedCartManager = makeCartManager(sharedShopManager)
    }
    
    // MARK: - Methods
    
    func makeDressFilterViewController() -> UIViewController {
        let container = GinoDressDependencyContainer(appContainer: self)
        let controller = DressFilterViewController(presenter: GinoDressFilterPresenter(container))
        controller.tabBarItem = UITabBarItem(title: "Filter dress", image: GinoIcon.dressFilter.image, tag: 1)
        
        return controller
    }
    
    func makeCartViewController() -> UIViewController {
        let controller = CartViewController(presenter: GinoCartPresenter(sharedCartManager))
        controller.tabBarItem = UITabBarItem(title: "Shopping cart", image: GinoIcon.shopCart.image, tag: 1)
        return controller
    }
}
