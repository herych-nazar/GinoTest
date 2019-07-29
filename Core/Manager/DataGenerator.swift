//
//  DataGenerator.swift
//  GinoTest
//
//  Created by Nazar Herych on 7/29/19.
//  Copyright © 2019 Nazar Herych. All rights reserved.
//

import UIKit

class GinoGenerator {
    
    static let shared = GinoGenerator()
    
    private init() { }
    
    func generateSizes() -> [SizeObject] {
        let xxxsInternationalUK = InternationalSize(value: ["keySymbol": "UK", "value": 4])
        let xxxs = SizeObject(value: ["name": DressSize.xxxs.rawValue, "bust": 77, "waist": 56, "hips": 84, "other": [xxxsInternationalUK]])
        
        let xxsInternationalUK = InternationalSize(value: ["keySymbol": "UK", "value": 6])
        let xxs = SizeObject(value: ["name": DressSize.xxs.rawValue, "bust": 81, "waist": 60, "hips": 88, "other": [xxsInternationalUK]])
        
        let xsInternationalUK = InternationalSize(value: ["keySymbol": "UK", "value": 8])
        let xs = SizeObject(value: ["name": DressSize.xs.rawValue, "bust": 85, "waist": 64, "hips": 92, "other": [xsInternationalUK]])
        
        let sInternationalUK = InternationalSize(value: ["keySymbol": "UK", "value": 10])
        let s = SizeObject(value: ["name": DressSize.s.rawValue, "bust": 89, "waist": 68, "hips": 96, "other": [sInternationalUK]])
        
        let mInternationalUK = InternationalSize(value: ["keySymbol": "UK", "value": 12])
        let m = SizeObject(value: ["name": DressSize.m.rawValue, "bust": 93, "waist": 72, "hips": 100, "other": [mInternationalUK]])
        
        let lInternationalUK = InternationalSize(value: ["keySymbol": "UK", "value": 14])
        let l = SizeObject(value: ["name": DressSize.l.rawValue, "bust": 98, "waist": 76, "hips": 104, "other": [lInternationalUK]])
        
        let xlInternationalUK = InternationalSize(value: ["keySymbol": "UK", "value": 16])
        let xl = SizeObject(value: ["name": DressSize.xl.rawValue, "bust": 103, "waist": 83, "hips": 110, "other": [xlInternationalUK]])
        
        let twoXLInternationalUK = InternationalSize(value: ["keySymbol": "UK", "value": 18])
        let twoXL = SizeObject(value: ["name": DressSize.twoXL.rawValue, "bust": 109, "waist": 90, "hips": 116, "other": [twoXLInternationalUK]])
        
        let threeXLInternationalUK = InternationalSize(value: ["keySymbol": "UK", "value": 20])
        let threeXL = SizeObject(value: ["name": DressSize.threeXL.rawValue, "bust": 116, "waist": 96, "hips": 123, "other": [threeXLInternationalUK]])
        
        let fourXLInternationalUK = InternationalSize(value: ["keySymbol": "UK", "value": 22])
        let fourXL = SizeObject(value: ["name": DressSize.fourXL.rawValue, "bust": 122, "waist": 103, "hips": 129, "other": [fourXLInternationalUK]])
        
        let fiveXLInternationalUK = InternationalSize(value: ["keySymbol": "UK", "value": 24])
        let fiveXL = SizeObject(value: ["name": DressSize.fiveXL.rawValue, "bust": 128, "waist": 110, "hips": 135, "other": [fiveXLInternationalUK]])
        
        let sixXLInternationalUK = InternationalSize(value: ["keySymbol": "UK", "value": 26])
        let sixXL = SizeObject(value: ["name": DressSize.sixXL.rawValue, "bust": 134, "waist": 117, "hips": 142, "other": [sixXLInternationalUK]])
        
        let sevenXLInternationalUK = InternationalSize(value: ["keySymbol": "UK", "value": 28])
        let sevenXL = SizeObject(value: ["name": DressSize.sevenXL.rawValue, "bust": 140, "waist": 124, "hips": 142, "other": [sevenXLInternationalUK]])
        
        let eightXLInternationalUK = InternationalSize(value: ["keySymbol": "UK", "value": 30])
        let eightXL = SizeObject(value: ["name": DressSize.eightXL.rawValue, "bust": 146, "waist": 131, "hips": 154, "other": [eightXLInternationalUK]])
        
        return [xxxs, xxs, xs, s, m, l, xl, twoXL, threeXL, fourXL, fiveXL, sixXL, sevenXL, eightXL]
    }
    
    func generateDress(name: String, size: SizeObject) -> DressObject? {
        let packs = Set((0..<3).compactMap({ _ in DressColor.allCases.randomElement() })).map {
            generateDressPack(size: size, color: $0)
        }
        
        return DressObject(value: ["name": name, "category": DressCategory.eveningWear.rawValue,
                                   "price": Int.random(in: 100...2000),
                                   "storage": packs,
                                   "image": UIImage(named: "dress3")?.pngData()])
    }
    
    func generateDressPack(size: SizeObject, color: DressColor) -> DressPack {
        let status = Availability.allCases.randomElement()
        
        return DressPack(value: ["size": size,
                                 "count": Int.random(in: 10...100),
                                 "color": color.rawValue,
                                 "status": status?.description])
        
    }
}
