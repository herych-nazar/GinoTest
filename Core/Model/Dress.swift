//
//  Dress.swift
//  GinoTest
//
//  Created by Nazar Herych on 7/28/19.
//  Copyright © 2019 Nazar Herych. All rights reserved.
//

import UIKit

protocol Dress {
    var availability: Availability? { get }
    var image: UIImage? { get }
    var price: Double { get }
    var allColors: [UIColor] { get }
    var description: String { get }
}

struct DressModel: Dress {
    var availability: Availability?
    var image: UIImage?
    var price: Double
    var allColors: [UIColor]
    var description: String
}

extension DressObject {
    func toDress(_ filter: DressFilterResult) -> Dress? {
        guard let pack = storage.elementWhere(filter.color, size: filter.size) else { return nil }
        return DressModel(availability: Availability(rawValue: pack.status),
                          image: UIImage(data: image),
                          price: price,
                          allColors: Array(storage.allColors()),
                          description: name)
    }
}
