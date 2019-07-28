//
//  String+converter->DressFilterResult.swift
//  GinoTest
//
//  Created by Nazar Herych on 7/28/19.
//  Copyright © 2019 Nazar Herych. All rights reserved.
//

import Foundation

extension String {
    func toDressCategory() -> DressCategory? {
        return DressCategory(rawValue: self)
    }
    
    func toDressColor() -> DressColor? {
        return DressColor(rawValue: self)
    }
    
    func toDressSize() -> DressSize? {
        return DressSize(rawValue: self)
    }
}
