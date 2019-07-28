//
//  Int+increment+decrement.swift
//  GinoTest
//
//  Created by Nazar Herych on 7/28/19.
//  Copyright © 2019 Nazar Herych. All rights reserved.
//

import Foundation

extension Int {
    mutating func increment() {
        self += 1
    }
    
    mutating func decrement() {
        self -= 1
    }
}
