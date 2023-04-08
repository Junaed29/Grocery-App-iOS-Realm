//
//  CategoryFilterView.swift
//  Grocery-App-iOS-Realm
//
//  Created by Junaed Muhammad Chowdhury on 8/4/23.
//

import SwiftUI

struct CategoryFilterView: View {
    let itemCategories = ["All", "Produce", "Fruit", "Meat", "Condiments", "Beverages", "Snacks", "Dairy"]
    
    @Binding var selectedCategory: String
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack{
                ForEach(itemCategories, id: \.self) {catgory in
                    Text(catgory)
                        .bold()
                        .padding(6)
                        .frame(minWidth: 100)
                        .background( selectedCategory != catgory ? .green : .orange)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .onTapGesture {
                            selectedCategory = catgory
                        }
                }
            }
        }
    }
}

struct CategoryFilterView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryFilterView(selectedCategory: .constant("Meat"))
    }
}
