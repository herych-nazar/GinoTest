//
//  Bool+orderColor.swift
//  GinoTest
//
//  Created by Nazar Herych on 8/5/19.
//  Copyright © 2019 Nazar Herych. All rights reserved.
//

import UIKit

extension Bool {
    func orderCartColor() -> UIColor {
        switch self {
        case false:
            return .white
        case true:
            return GinoColor.green
        }
    }
}
