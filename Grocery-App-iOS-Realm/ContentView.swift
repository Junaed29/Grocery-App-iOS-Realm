//
//  ContentView.swift
//  Grocery-App-iOS-Realm
//
//  Created by Junaed Muhammad Chowdhury on 2/4/23.
//

import SwiftUI
import RealmSwift

struct ContentView: View {
    
    @State private var isPresented = false
    @ObservedResults(ShoppingList.self) var shoppingList
    
    var body: some View {
        NavigationStack{
            ZStack {
                List {
                    ForEach(shoppingList, id: \.id) { listItem in
                        VStack(alignment: .leading){
                            Text(listItem.title)
                            Text(listItem.address).opacity(0.4)
                        }
                    }.onDelete(perform: $shoppingList.remove(atOffsets:))
                }
                
                if shoppingList.isEmpty{
                    Text("No Shopping List")
                }
            }
            .navigationTitle("Grocery App")
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
                AddShoppingListScreen()
            }
        }
         
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
