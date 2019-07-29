//
//  SizeObject.swift
//  GinoTest
//
//  Created by Nazar Herych on 7/29/19.
//  Copyright © 2019 Nazar Herych. All rights reserved.
//

import RealmSwift

extension SizeObject {
    func description() -> String? {
        var description = ""
        
        guard let sizeCode = DressSize(rawValue: name) else { return nil }
        description = "Your size: \(sizeCode.rawValue)"
        
        if let ukSize = other.element("UK")?.value {
            description += "\nYour UK size: \(ukSize)"
        }
        
        if let euSize = other.element("EU")?.value {
            description += "\nYour EU size: \(euSize)"
        }
        
        return description
    }
}
