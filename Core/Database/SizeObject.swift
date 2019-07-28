//
//  Size.swift
//  GinoTest
//
//  Created by Nazar Herych on 7/28/19.
//  Copyright © 2019 Nazar Herych. All rights reserved.
//

import RealmSwift

final class SizeObject: Object {
    @objc dynamic var name = ""
    @objc dynamic var bust = 0
    @objc dynamic var waist = 0
    @objc dynamic var hips = 0
    var other = List<InternationalSize>()
    
    override static func primaryKey() -> String? {
        return "name"
    }
}

final class InternationalSize: Object {
    @objc dynamic var keySymb = ""
    @objc dynamic var value = 0
    
    override static func primaryKey() -> String? {
        return "keySymb"
    }
}
