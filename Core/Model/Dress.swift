//
//  Dress.swift
//  GinoTest
//
//  Created by Nazar Herych on 7/28/19.
//  Copyright © 2019 Nazar Herych. All rights reserved.
//

import UIKit

protocol Dress: class {
    var dress: DressObject { get }
    var color: DressColor { get }
    var availability: Availability? { get }
    var orderCount: Int? { get set }
}

class DressModel: Dress {
    let dress: DressObject
    let color: DressColor
    let availability: Availability?
    var orderCount: Int?
    
    init(dress: DressObject, availability: Availability?, color: DressColor, orderCount: Int?) {
        self.dress = dress
        self.color = color
        self.availability = availability
        self.orderCount = orderCount
    }
}

extension Dress {
    func isEqual(to otherDress: Dress) -> Bool {
        return dress.name == otherDress.dress.name
    }
}

extension DressObject {
    func toDress(_ filter: DressFilterResult) -> Dress? {
        guard storage.elementWhere(filter.color, size: filter.size) != nil else { return nil }
        return DressModel(dress: self, availability: storage.availability(for: filter), color: filter.color, orderCount: nil)
    }
}

extension Dress {
    func allColors() -> [DressColor] {
        return Array(dress.storage.allColors())
    }
}
