//
//  DressFilterPresenter.swift
//  GinoTest
//
//  Created by Nazar Herych on 7/27/19.
//  Copyright © 2019 Nazar Herych. All rights reserved.
//

import Foundation

protocol DressFilterPresenter {
    
}

final class GinoDressFilterPresenter: DressFilterPresenter {
    
    // MARK: - Properties
    
    private let dressDependencyContainer: GinoDressDependencyContainer
    
    // MARK: - Constructor
    
    init(_ container: GinoDressDependencyContainer) {
        dressDependencyContainer = container
    }
}
