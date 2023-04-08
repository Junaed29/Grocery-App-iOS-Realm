//
//  AddShoppingItemScreen.swift
//  Grocery-App-iOS-Realm
//
//  Created by Junaed Muhammad Chowdhury on 7/4/23.
//

import SwiftUI
import RealmSwift

struct AddShoppingItemScreen: View {
    
    @ObservedRealmObject var shoppingList: ShoppingList
    @Environment(\.dismiss) private var dismiss
    
    @State private var title = ""
    @State private var quentity = ""
    @State private var selectedCategory = ""
    
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    let itemCategories = ["Produce", "Fruit", "Meat", "Condiments", "Beverages", "Snacks", "Dairy"]
    
    var body: some View {
        NavigationStack{
            VStack {
                LazyVGrid(columns: columns) {
                    ForEach(itemCategories, id: \.self) {catgory in
                        Text(catgory)
                            .font(.caption)
                            .bold()
                            .padding()
                            .frame(width: 115)
                            .background( selectedCategory != catgory ? .green : .orange)
                            .cornerRadius(10)
                            .foregroundColor(.white)
                            .onTapGesture {
                                selectedCategory = catgory
                            }
                    }
                }
                Spacer().frame(height: 60)
                
                TextField("Title", text: $title)
                    .textFieldStyle(.roundedBorder)
                
                TextField("Quentity", text: $quentity)
                    .textFieldStyle(.roundedBorder)
                    .keyboardType(.numberPad)
                
                Button {
                    let shoppingItem = ShoppingItem()
                    
                    shoppingItem.title    = title
                    shoppingItem.quentity = Int(quentity) ?? 1
                    shoppingItem.category = selectedCategory
                    
                    $shoppingList.items.append(shoppingItem)
                    
                    
                    dismiss()
                    
                } label: {
                    Text("Save")
                        .frame(maxWidth: .infinity, maxHeight: 35)
                }
                .padding(.top,20)
                .buttonStyle(.bordered)
                
                Spacer()
                
            }
            .padding()
            .navigationTitle("Add Item")
        }
    }
}

struct AddShoppingItemScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddShoppingItemScreen(shoppingList: ShoppingList())
    }
}
