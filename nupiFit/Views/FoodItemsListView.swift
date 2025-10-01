//
//  FoodItemsListView.swift
//  nupiFit
//
//  Created by Andres Rojas on 22.09.25.
//

import SwiftUI
import SwiftData

struct FoodItemsListView: View {
    
    @Environment(\.modelContext) private var context
    @Query var allFoods: [FoodItem]
    var testArray: [FoodItem] = []
    
    var body: some View {
        
        ForEach(allFoods) { foodItemElement in
            FoodItemDescriptionCell(foodItem: foodItemElement)
        }
        
    }
}

#Preview {
    
    FoodItemsListView()
}
