//
//  FoodItemDescriptionCell.swift
//  nupiFit
//
//  Created by Andres Rojas on 19.09.25.
//

import SwiftUI

struct FoodItemDescriptionCell: View {
    
    private var arrayOfMiam2: [FoodItem] = [
        FoodItem(name: "food1", brand: "brand1", typeIcon: "frying.pan", basePortionQuantity: 123, basePortionUnit: "g", fat: 9, carbs: 12, protein: 12, kcal: 123),
        FoodItem(name: "food2", brand: "food2", typeIcon: "carrot", basePortionQuantity: 12, basePortionUnit: "EL", fat: 8, carbs: 34, protein: 32, kcal: 1300),
        FoodItem(name: "food3", brand: "brand3", typeIcon: "frying.pan", basePortionQuantity: 45, basePortionUnit: "g", fat: 7, carbs: 8, protein: 23, kcal: 126),
        FoodItem(name: "food4", brand: "brand", typeIcon: "cart", basePortionQuantity: 67, basePortionUnit: "mL", fat: 6, carbs: 67, protein: 88, kcal: 430)
    ]
    
    var body: some View {

        VStack {
            HStack {
                Image(systemName: "carrot")
                Text("Haferflocken")
                    .font(.caption)
                Text("Ja!")
                    .font(.caption)
                    .italic()
                Spacer()
            }
            HStack {
                Text("1400kcal -")
                Text("8g (F)")
                Text("54g (C)")
                Text("12g (P)")
                Text("(1 Saucisse)")
                Spacer()
            }.italic().font(.caption)
        }
        .padding(10)
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.black, lineWidth: 1))
        .padding()
    }
}

#Preview {
    FoodItemDescriptionCell()
}

