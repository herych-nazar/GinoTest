//
//  Availability.swift
//  GinoTest
//
//  Created by Nazar Herych on 7/28/19.
//  Copyright © 2019 Nazar Herych. All rights reserved.
//

import UIKit

enum Availability: String, CaseIterable {
    case inStock = "IN STOCK"
    case inPoduction = "IN PRODUCTION"
    case forwardOrder = "FORWARD ORDER"
    
    var description: String {
        return rawValue
    }
    
    var textColor: UIColor {
        switch self {
        case .inStock:
            return GinoColor.inStockText
        case .inPoduction:
            return GinoColor.inPoductionText
        case .forwardOrder:
            return GinoColor.forwardOrderText
        }
    }
    
    var backgroundColor: UIColor {
        switch self {
        case .inStock:
            return GinoColor.inStockBackground
        case .inPoduction:
            return GinoColor.inPoductionBackground
        case .forwardOrder:
            return GinoColor.forwardOrderBackground
        }
    }
}
