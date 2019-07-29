//
//  SizeObject+sizeFor.swift
//  GinoTest
//
//  Created by Nazar Herych on 7/29/19.
//  Copyright © 2019 Nazar Herych. All rights reserved.
//

import Foundation

extension Array where Element == SizeObject {
    func sizeForBust(_ bust: Int) -> SizeObject? {
        return filter { $0.bust <= bust }
            .max(by: { $0.bust < $1.bust })
    }
    
    func sizeForWais(_ waist: Int) -> SizeObject? {
        return filter { $0.waist <= waist }
            .max(by: { $0.waist < $1.waist })
    }
    
    func sizeForHips(_ hips: Int) -> SizeObject? {
        return filter { $0.hips <= hips }
            .max(by: { $0.hips < $1.hips })
    }
}
