//
//  List+internationalElemen.swift
//  GinoTest
//
//  Created by Nazar Herych on 7/29/19.
//  Copyright © 2019 Nazar Herych. All rights reserved.
//

import RealmSwift

extension List where Element == InternationalSize {
    func element(_ key: String) -> InternationalSize? {
        return first(where: { $0.keySymbol == key })
    }
}
