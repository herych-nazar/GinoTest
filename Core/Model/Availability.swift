//
//  Availability.swift
//  GinoTest
//
//  Created by Nazar Herych on 7/28/19.
//  Copyright © 2019 Nazar Herych. All rights reserved.
//

import UIKit

enum Availability {
    case inStock
    case inPoduction
    case forwardOrder
    
    var description: String {
        switch self {
        case .inStock:
            return "IN STOCK"
        case .inPoduction:
            return "IN PRODUCTION"
        case .forwardOrder:
            return "FORWARD ORDER"
        }
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
