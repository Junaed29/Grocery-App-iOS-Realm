//
//  AddShoppingListScreen.swift
//  Grocery-App-iOS-Realm
//
//  Created by Junaed Muhammad Chowdhury on 6/4/23.
//

import SwiftUI
import RealmSwift

struct AddShoppingListScreen: View {
    @State private var title = ""
    @State private var address = ""
    
    @ObservedResults(ShoppingList.self) var shoppingList
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Enter title", text: $title)
                TextField("Enter address", text: $address)
                Button {
                    
                    let shoppingListItem = ShoppingList()
                    shoppingListItem.title = title
                    shoppingListItem.address = address
                    
                    $shoppingList.append(shoppingListItem)
                    
                    dismiss()
                } label: {
                    Text("Save")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.bordered)

                
            }
            .navigationTitle("New List")
        }
    }
}

struct AddShoppingListScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddShoppingListScreen()
    }
}
