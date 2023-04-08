//
//  Migrator.swift
//  Grocery-App-iOS-Realm
//
//  Created by Junaed Muhammad Chowdhury on 7/4/23.
//

import Foundation
import RealmSwift

class Migrator{
    
    init(){
        updateSchema()
    }
    
    
    func updateSchema(){
        let config = Realm.Configuration(schemaVersion: 3) { migration, oldSchemaVersion in
            if oldSchemaVersion < 1{
                //Add new field
                migration.enumerateObjects(ofType: ShoppingList.className()) { _, newObject in
                    newObject!["items"] = List<ShoppingItem>()
                }
            }
            
            if oldSchemaVersion < 2{
                //Add new field
                migration.enumerateObjects(ofType: ShoppingItem.className()) { _, newObject in
                    newObject!["category"] = ""
                }
            }
            
            if oldSchemaVersion < 3{
                //Add new field
                migration.enumerateObjects(ofType: ShoppingItem.className()) { _, newObject in
                    newObject!["quentity"] = 0
                }
            }
        }
        
        Realm.Configuration.defaultConfiguration = config
        let _ = try! Realm()
    }
}
