//
//  Dress+maxOrder.swift
//  GinoTest
//
//  Created by Nazar Herych on 7/29/19.
//  Copyright © 2019 Nazar Herych. All rights reserved.
//

import Foundation

extension Dress {
    func maxOrder() -> Int {
        return dress.storage.elementWhere(color, size: size)?.count ?? 0
    }
}
