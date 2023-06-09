//
//  RouteManager.swift
//  Grocery-App-iOS-Realm
//
//  Created by Junaed Muhammad Chowdhury on 9/6/23.
//

import SwiftUI

enum Routes: Hashable {
    case toShoppingListItemsView(ShoppingList)
    case toAddShoppingItemScreen(ShoppingList, ShoppingItem)
}

struct RouteModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .navigationDestination(for: Routes.self) { route in
                switch route{
                case let .toAddShoppingItemScreen(shoppingList, shoppingItem):
                    AddShoppingItemScreen(shoppingList: shoppingList, itemToEdit: shoppingItem)
                    
                    
                case let .toShoppingListItemsView(shoppingList):
                    ShoppingListItemsScreen(shoppingList: shoppingList)
                }
            }
    }
}
