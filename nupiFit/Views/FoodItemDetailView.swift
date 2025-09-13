//
//  FoodDetailView.swift
//  nupiFit
//
//  Created by Andres Rojas on 06.09.25.
//

import SwiftUI

struct FoodItemDetailView: View {
    
    var  foodItem: FoodItem
    
    var body: some View {
        VStack (alignment: .leading, spacing: 20){
            HStack {
                Spacer()
                Button {
                    print("Touched!")
                } label: {
                    Text("Edit")
                }
            }.padding()

            Image(systemName: "carrot")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundStyle(.orange)
            VStack (alignment: .leading) {
                Text(foodItem.name)
                Text(foodItem.brand).italic()
            }.bold()
            Section {
                VStack (alignment: .leading) {
                    Text("Fat: \t\t\(String(foodItem.fat)) g")
                    Text("Carbs: \t\t\(String(foodItem.carbs)) g")
                    Text("Protein: \t\(String(foodItem.protein)) g")
                    Text("kCal: \t\t\(String(foodItem.kcal)) g")
                }.italic()
            } header : {
                Text("Stats pro portion").font(.title)
            }
            HStack {
                Text("Portion is: \(String(foodItem.basePortionQuantity)) \(foodItem.basePortionUnit)").bold()
                Text("(\(String(foodItem.basePortionSIQuantity!)) \(foodItem.basePortionSIUnit!))").italic()
            }
            Spacer()
        }.padding()
    }
}

#Preview {
    FoodItemDetailView(foodItem: FoodItem(name: "foodName", brand: "foodBrand", fat: 10, carbs: 20, protein: 30, basePortionQuantity: 1, basePortionUnit: "Saucisse", basePortionSIQuantity: 30, basePortionSIUnit: "g"))
}
