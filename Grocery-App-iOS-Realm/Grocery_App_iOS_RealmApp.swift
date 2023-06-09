//
//  Grocery_App_iOS_RealmApp.swift
//  Grocery-App-iOS-Realm
//
//  Created by Junaed Muhammad Chowdhury on 2/4/23.
//

import SwiftUI

@main
struct Grocery_App_iOS_RealmApp: App {
    
    init(){
        let _ = Migrator()
    }
    
    var body: some Scene {
        WindowGroup {
            let _ = UserDefaults.standard.set(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable") // Hide auto layout constain worning
            let _ = print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.path())  // Realm file
            ShoppingListView()
        }
    }
}
