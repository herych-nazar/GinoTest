//
//  Array<DressColor>+toColor.swift
//  GinoTest
//
//  Created by Nazar Herych on 7/29/19.
//  Copyright © 2019 Nazar Herych. All rights reserved.
//

import UIKit

extension Array where Element == DressColor {
    func toColor() -> [UIColor] {
        return map { $0.color }
    }
}
