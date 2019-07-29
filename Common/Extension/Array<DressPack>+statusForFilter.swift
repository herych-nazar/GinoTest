//
//  Array<DressPack>+statusForFilter.swift
//  GinoTest
//
//  Created by Nazar Herych on 7/29/19.
//  Copyright © 2019 Nazar Herych. All rights reserved.
//

import RealmSwift

extension List where Element == DressPack {
    func availability(for filter: DressFilterResult) -> Availability? {
        guard let status = elementWhere(filter.color, size: filter.size)?.status else { return nil }
        return Availability(rawValue: status)
    }
}
