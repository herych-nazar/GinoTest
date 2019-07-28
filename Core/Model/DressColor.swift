//
//  DressColor.swift
//  GinoTest
//
//  Created by Nazar Herych on 7/28/19.
//  Copyright © 2019 Nazar Herych. All rights reserved.
//

import UIKit

enum DressColor: String, CaseIterable {
    case red
    case blue
    case green
    case blush
    case gold
    case coral
}

extension DressColor {
    var color: UIColor {
        switch self {
        case .red: return .red
        case .blue: return .blue
        case .green: return .green
        case .blush: return .cyan
        case .gold: return .yellow
        case .coral: return .orange
        }
    }
}
