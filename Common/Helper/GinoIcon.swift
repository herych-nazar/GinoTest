//
//  GinoIcon.swift
//  GinoTest
//
//  Created by Nazar Herych on 7/28/19.
//  Copyright © 2019 Nazar Herych. All rights reserved.
//

import UIKit

enum GinoIcon: String {
    case minus
    case plus
    case delete
    
    case shopCart
    case dressFilter
    
    var image: UIImage? {
        return UIImage(named: self.rawValue)
    }
}

