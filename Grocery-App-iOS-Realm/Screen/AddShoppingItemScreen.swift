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
    var itemToEdit: ShoppingItem?
    
    @State private var title = ""
    @State private var quentity = ""
    @State private var selectedCategory = ""
    
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    let itemCategories = ["Produce", "Fruit", "Meat", "Condiments", "Beverages", "Snacks", "Dairy"]
    
    init(shoppingList: ShoppingList, itemToEdit: ShoppingItem? = nil) {
        self.shoppingList = shoppingList
        self.itemToEdit = itemToEdit
        
        if let itemToEdit {
            _title            = State(initialValue: itemToEdit.title)
            _quentity         = State(initialValue: String(itemToEdit.quentity))
            _selectedCategory = State(initialValue: itemToEdit.category)
        }
    }
    
    
    var body: some View {
        VStack(alignment: .leading) {
            
            if itemToEdit == nil{
                Text("Add Item")
                    .font(.largeTitle)
                    .bold()
            }
            
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
                
                if let _ = itemToEdit{
                    //Update
                    print("Update")
                    updateItem()
                }else{
                    //Save
                    saveitem()
                }
                
                dismiss()
                
            } label: {
                Text(itemToEdit == nil ? "Save" : "Update")
                    .frame(maxWidth: .infinity, maxHeight: 35)
            }
            .padding(.top,20)
            .buttonStyle(.bordered)
            
            Spacer()
            
        }
        .padding()
        .navigationTitle("Update Item")
    }
    
    private func saveitem(){
        let shoppingItem = ShoppingItem()
        
        shoppingItem.title    = title
        shoppingItem.quentity = Int(quentity) ?? 1
        shoppingItem.category = selectedCategory
        
        $shoppingList.items.append(shoppingItem)
    }
    
    private func updateItem(){
        if let itemToEdit{
            print("Into do")
            do{
                let realm = try Realm()
                guard let objectTopdate = realm.object(ofType: ShoppingItem.self, forPrimaryKey: itemToEdit.id) else {
                    print("Id Not found")
                    return
                }
                
                
                try realm.write {
                    objectTopdate.title    = title
                    objectTopdate.quentity = Int(quentity) ?? 1
                    objectTopdate.category = selectedCategory
                }
            }catch{
                print(error)
            }
            
        }
    }
}

struct AddShoppingItemScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddShoppingItemScreen(shoppingList: ShoppingList(), itemToEdit: ShoppingItem())
    }
}
