//
//  ShoppingListItemCell.swift
//  Grocery-App-iOS-Realm
//
//  Created by Junaed Muhammad Chowdhury on 8/4/23.
//

import SwiftUI

struct ShoppingListItemCell: View {
    
    let shoppingItem: ShoppingItem
    var isSelected: Bool
    let getSelected: (Bool) -> Void
    
    var body: some View {
        HStack {
            Image(systemName: isSelected ? "checkmark.square.fill" : "square")
                .onTapGesture {
                    getSelected(!isSelected)
                }
            
            VStack(alignment: .leading) {
                Text(shoppingItem.title)
                Text(shoppingItem.category).opacity(0.5)
            }
            
            Spacer()
            
            Text("\(shoppingItem.quentity)")
        }.opacity(isSelected ? 0.4 : 1 )
    }
}

struct ShoppingListItemCell_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingListItemCell(shoppingItem: ShoppingItem(), isSelected: true, getSelected: {_ in })
    }
}
