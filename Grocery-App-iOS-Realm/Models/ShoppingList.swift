//
//  ShoppingList.swift
//  Grocery-App-iOS-Realm
//
//  Created by Junaed Muhammad Chowdhury on 6/4/23.
//

import Foundation
import RealmSwift

class ShoppingList: Object, Identifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title: String
    @Persisted var address: String
    
    override class func primaryKey() -> String? {
        "id"
    }
}
