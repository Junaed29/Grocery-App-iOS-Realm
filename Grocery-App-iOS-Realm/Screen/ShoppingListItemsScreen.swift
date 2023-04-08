//
//  ShoppingListItemsScreen.swift
//  Grocery-App-iOS-Realm
//
//  Created by Junaed Muhammad Chowdhury on 7/4/23.
//

import SwiftUI
import RealmSwift

struct ShoppingListItemsScreen: View {
    
    @State private var isPresented = false
    @ObservedRealmObject var shoppingList: ShoppingList
    
    var body: some View {
        VStack{
            Text("Hello, World!")
        }
        .navigationTitle(shoppingList.title)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    isPresented = true
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $isPresented) {
            AddShoppingItemScreen(shoppingList: shoppingList)
        }
    }
}

struct ShoppingListItemsScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            ShoppingListItemsScreen(shoppingList: ShoppingList())
        }
    }
}
