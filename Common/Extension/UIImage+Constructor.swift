//
//  UIImage+Constructor.swift
//  GinoTest
//
//  Created by Nazar Herych on 7/29/19.
//  Copyright © 2019 Nazar Herych. All rights reserved.
//

import UIKit

extension UIImage {
    convenience init?(data: Data?) {
        guard let data = data else { return nil }
        self.init(data: data)
    }
}
