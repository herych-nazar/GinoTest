//
//  DressFilterPresenter.swift
//  GinoTest
//
//  Created by Nazar Herych on 7/27/19.
//  Copyright © 2019 Nazar Herych. All rights reserved.
//

import UIKit

protocol DressFilterPresenter {
    func makeSizeCalculator() -> UIViewController
    func makeDressResult(dressResult: DressFilterResult) -> UIViewController
}

final class GinoDressFilterPresenter: DressFilterPresenter {
    
    // MARK: - Properties
    
    private let dressDependencyContainer: GinoDressDependencyContainer
    
    // MARK: - Constructor
    
    init(_ container: GinoDressDependencyContainer) {
        dressDependencyContainer = container
    }
    
    func makeSizeCalculator() -> UIViewController {
        return dressDependencyContainer.makeSizeCalculatorViewController()
    }
    
    func makeDressResult(dressResult: DressFilterResult) -> UIViewController {
        return dressDependencyContainer.makeDressResultViewController(filterResult: dressResult)
    }
}
