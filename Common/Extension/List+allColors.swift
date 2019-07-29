//
//  List+allColors.swift
//  GinoTest
//
//  Created by Nazar Herych on 7/29/19.
//  Copyright © 2019 Nazar Herych. All rights reserved.
//

import RealmSwift

extension List where Element == DressPack {
    func allColors() -> Set<DressColor> {
        return Set(compactMap({ DressColor(rawValue: $0.color) }))
    }
}
