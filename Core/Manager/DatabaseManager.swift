//
//  DatabaseManager.swift
//  GinoTest
//
//  Created by Nazar Herych on 7/27/19.
//  Copyright © 2019 Nazar Herych. All rights reserved.
//

import Foundation
import RealmSwift

protocol DatabaseManager {
    func loadSizes() -> [SizeObject]
    func loadSize(_ key: DressSize) -> SizeObject?
    func loadDresses(_ category: DressCategory) -> [DressObject]
    func loadDresses() -> [DressObject]
    
    func saveSize(_ size: SizeObject)
    func saveDress(_ dress: DressObject)
    
    func deleteAllData()
}


final class GinoDatabaseManager: DatabaseManager {
    
    // MARK: - Properties
    
    private let realm = try! Realm()
    
}

// MARK: - Loadable
extension GinoDatabaseManager {
    func loadSizes() -> [SizeObject] {
        return Array(realm.objects(SizeObject.self))
    }
    
    func loadSize(_ key: DressSize) -> SizeObject? {
        return realm.object(ofType: SizeObject.self, forPrimaryKey: key.rawValue)
    }
    
    func loadDresses(_ category: DressCategory) -> [DressObject] {
        let predicate = NSPredicate(format: "category == %@", category.rawValue)
        
        return Array(realm
            .objects(DressObject.self)
            .filter(predicate))
    }
    
    func loadDresses() -> [DressObject] {
        return Array(realm.objects(DressObject.self))
    }
}

// MARK: - Writable
extension GinoDatabaseManager {
    func saveSize(_ size: SizeObject) {
        try! realm.write {
            realm.add(size)
        }
    }
    
    func saveDress(_ dress: DressObject) {
        try! realm.write {
            realm.add(dress)
        }
    }
}

extension GinoDatabaseManager {
    func deleteAllData() {
        try? realm.write {
            realm.deleteAll()
        }
    }
}


extension List where Element == DressPack {
    func hasElementWith(_ color: DressColor, size: DressSize) -> Bool {
        return contains(where: {
            ($0.color == color.rawValue) && ($0.size?.name == size.rawValue)
        })
    }
    
    func elementWhere(_ color: DressColor, size: DressSize) -> DressPack? {
        return first(where: {
            ($0.color == color.rawValue) && ($0.size?.name == size.rawValue)
        })
    }
    
    func allColors() -> Set<DressColor> {
        return Set(compactMap({ DressColor(rawValue: $0.color) }))
    }
}
