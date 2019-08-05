//
//  DatabaseManager.swift
//  GinoTest
//
//  Created by Nazar Herych on 7/27/19.
//  Copyright © 2019 Nazar Herych. All rights reserved.
//

import Foundation
import RealmSwift

protocol DatabaseManager: DatabaseLoader, DatabaseWriter {
    func deleteAllData()
}

protocol DatabaseLoader {
    func loadSizes() -> [SizeObject]
    func loadSize(_ key: DressSize) -> SizeObject?
    func loadDresses(_ category: DressCategory) -> [DressObject]
    func loadDresses() -> [DressObject]
}

protocol DatabaseWriter {
    func saveSize(_ size: SizeObject)
    func saveDress(_ dress: DressObject)
    func updateDressCounter(_ dressPack: DressPack, removedUnits units: Int)
}


final class GinoDatabaseManager: DatabaseManager {

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
        try? realm.write {
            realm.add(size)
        }
    }
    
    func saveDress(_ dress: DressObject) {
        try? realm.write {
            realm.add(dress)
        }
    }
}

// MARK: - Removable
extension GinoDatabaseManager {
    func deleteAllData() {
        try? realm.write {
            realm.deleteAll()
        }
    }
}

// MARK: - Updatable
extension GinoDatabaseManager {
    func updateDressCounter(_ dressPack: DressPack, removedUnits units: Int) {
        try? realm.write {
            dressPack.count -= units
        }
    }
}
