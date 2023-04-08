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
    @State private var selectedItemids: [ObjectId] = []
    
    var body: some View {
        VStack{
            if shoppingList.items.isEmpty{
                Text("No item added")
            }
            
            List {
                ForEach(shoppingList.items, id: \.id) {item in
                    ShoppingListItemCell(shoppingItem: item, isSelected: selectedItemids.contains(item.id)) { selectionState in
                        if(selectionState){
                            selectedItemids.append(item.id)
                        }else{
                            if let index = selectedItemids.firstIndex(where: {$0 == item.id}){
                                selectedItemids.remove(at: index)
                            }
                        }
                    }
                }
            }
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
