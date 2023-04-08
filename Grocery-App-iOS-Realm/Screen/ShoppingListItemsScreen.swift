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
    
    @State var selectedCategory = "All"
    
    var items: [ShoppingItem]{
        if selectedCategory == "All"{
            return Array(shoppingList.items)
        }else{
            return shoppingList.items.sorted(byKeyPath: "title").filter { $0.category == selectedCategory}
        }
    }
    
    var body: some View {
        VStack{
            
            CategoryFilterView(selectedCategory: $selectedCategory)
                .padding([.top,.bottom, .leading])
            
            if items.isEmpty{
                Text("No item found")
            }
            
            List {
                ForEach(items, id: \.id) {item in
                    
                    NavigationLink {
                        AddShoppingItemScreen(shoppingList: shoppingList, itemToEdit: item)
                    } label: {
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

                    
                }.onDelete(perform: deleteItem)
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
    
    private func deleteItem(indexSet: IndexSet){
        for index in indexSet{
            if let deleteIndex = shoppingList.items.firstIndex(of: items[index]){
                $shoppingList.items.remove(at: deleteIndex)
            }
        }
    }
}

struct ShoppingListItemsScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ShoppingListItemsScreen(shoppingList: ShoppingList())
                .navigationTitle("HAha")
        }
    }
}
