//
//  Dress.swift
//  GinoTest
//
//  Created by Nazar Herych on 7/28/19.
//  Copyright © 2019 Nazar Herych. All rights reserved.
//

import UIKit

protocol Dress {
    var availability: Availability { get }
    var image: UIImage { get }
    var price: Double { get }
    var allColors: [UIColor] { get }
    var description: String { get }
}

struct DressModel: Dress {
    var availability: Availability
    var image: UIImage
    var price: Double
    var allColors: [UIColor]
    var description: String
}
