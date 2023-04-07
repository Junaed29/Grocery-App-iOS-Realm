//
//  ShoppingItem.swift
//  Grocery-App-iOS-Realm
//
//  Created by Junaed Muhammad Chowdhury on 7/4/23.
//

import Foundation
import RealmSwift


class ShoppingItem: Object, Identifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    
    @Persisted var title: String
    @Persisted var quentity: String
    
    override class func primaryKey() -> String? {
        "id"
    }
}
