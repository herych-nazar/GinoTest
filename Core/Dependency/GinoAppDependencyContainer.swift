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
        
        func makeCartManager(_ shop: ShopBuyable) -> CartManager {
            return GinoCartManager(shop)
        }
        
        sharedDatabaseManager = makeDatabaseManager()
        sharedShopManager = makeShopManager(sharedDatabaseManager)
        sharedCartManager = makeCartManager(sharedShopManager)
    }
    
    // MARK: - Methods
    
    func makeDressFilterViewController() -> UIViewController {
        let container = GinoDressDependencyContainer(appContainer: self)
        return DressFilterViewController(presenter: GinoDressFilterPresenter(container))
    }
    
    func makeCartViewController() -> UIViewController {
        return CartViewController(presenter: GinoCartPresenter(sharedCartManager))
    }
}
