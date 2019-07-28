//
//  Dress.swift
//  GinoTest
//
//  Created by Nazar Herych on 7/28/19.
//  Copyright © 2019 Nazar Herych. All rights reserved.
//

import RealmSwift

final class DressObject: Object {
    @objc dynamic var name = ""
    @objc dynamic var category = ""
    @objc dynamic var price = 0.0
    @objc dynamic var image: Data? = nil
    var storage = List<DressPack>()
    
    override static func primaryKey() -> String? {
        return "name"
    }
}

final class DressPack: Object {
    @objc dynamic var size: SizeObject?
    @objc dynamic var count = 0
    @objc dynamic var color = ""
    @objc dynamic var status = ""
    
    override static func indexedProperties() -> [String] {
        return ["color"]
    }
}

