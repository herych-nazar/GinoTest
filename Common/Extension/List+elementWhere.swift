//
//  List+elementWith.swift
//  GinoTest
//
//  Created by Nazar Herych on 7/29/19.
//  Copyright © 2019 Nazar Herych. All rights reserved.
//

import RealmSwift

extension List where Element == DressPack {
    func hasElementWith(_ color: DressColor, size: DressSize) -> Bool {
        return contains(where: {
            ($0.color == color.rawValue) && ($0.size?.name == size.rawValue)
        })
    }
    
    func elementWhere(_ color: DressColor, size: DressSize) -> DressPack? {
        return first(where: {
            ($0.color == color.rawValue) && ($0.size?.name == size.rawValue)
        })
    }
}
