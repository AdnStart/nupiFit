//
//  FoodDetailView.swift
//  nupiFit
//
//  Created by Andres Rojas on 06.09.25.
//

import SwiftUI

struct FoodItemInputView: View {
    
    @State private var name: String = ""
    @State private var brand: String = ""
    @State private var portionAmount: String = ""
    @State private var portionUnit: String = ""
    @State private var portionAmountSI: String = ""
    @State private var portionUnitSI: String = ""
    @State private var fat: String = ""
    @State private var carbs: String = ""
    @State private var protein: String = ""
    
    
    
    var  foodItem: FoodItem
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button {
                    print("Touched!")
                } label: {
                    Text("Save")
                }.padding()
            }
            Image (systemName: "carrot")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
                .foregroundStyle(.orange)
                .padding(.bottom)
            Form {
                Section(header: Text("Name")) {
                    TextField("Name", text: $name)
                    TextField("Brand", text: $brand)
                }
                Section(header: Text("Portion Definition")) {
                    HStack (alignment: .center){
                        Text("Custom").frame(maxWidth: .infinity, alignment: .leading)
                        TextField("Amount", text: $portionAmount).numberInputValidation($portionAmount).frame(maxWidth: .infinity)
                        TextField("Unit", text: $portionUnit).frame(maxWidth: .infinity)
                    }
                    HStack (alignment: .center) {
                        Text("SI").frame(maxWidth: .infinity, alignment: .leading)
                        TextField("Amount", text: $portionAmountSI).numberInputValidation($portionAmountSI).frame(maxWidth: .infinity)
                        TextField("Unit", text: $portionUnitSI).frame(maxWidth: .infinity)
                    }
                }
                Section(header: Text("Macros per portion in grams\nfat / carbs / protein")) {
                    HStack{
                        TextField(text: $fat, label: {Text("fat")}).numberInputValidation($fat).frame(maxWidth: .infinity)
                        TextField(text: $carbs, label: {Text("carbs")}).numberInputValidation($carbs).frame(maxWidth: .infinity)
                        TextField(text: $protein, label: {Text("protein")}).numberInputValidation($carbs).frame(maxWidth: .infinity)
                    }
                    HStack {
                        Spacer()
                        Text("Total Calories: \(String(format: "%.2f", calculateCalories(fat: fat, carbs: carbs, protein: protein))) kCal")
                    }
                }
            }
        }
    }
    
    func calculateCalories(fat: String, carbs: String, protein: String) -> Double {
        let fatDouble: Double = castStringToDouble(fat) ?? 0
        let carbsDouble: Double = castStringToDouble(carbs) ?? 0
        let proteinDouble: Double = castStringToDouble(protein) ?? 0
        return (fatDouble * 9) + (carbsDouble * 4) + (proteinDouble * 4)
    }
    
    func castStringToDouble(_ string: String) -> Double? {
        return Double(string.replacingOccurrences(of: ",", with: "."))
    }
}


#Preview {
    FoodItemInputView(foodItem: FoodItem(name: "foodName", brand: "foodBrand", fat: 10, carbs: 20, protein: 30, basePortionQuantity: 1, basePortionUnit: "Saucisse", basePortionSIQuantity: 30, basePortionSIUnit: "g"))
}


//    }
//    VStack (alignment: .leading, spacing: 20) {
//        HStack {
//            TextField(text: $fat, label: {Text("fat (g)")}).numberInputValidation($fat).frame(width: 100)
//            Text("fat (g)").italic()
//            Spacer()
//        }
//        HStack {
//            TextField(text: $carbs, label: {Text("carbs (g)")}).numberInputValidation($carbs).frame(width: 100)
//            Text("carbs (g)").italic()
//            Spacer()
//        }
//        HStack {
//            TextField(text: $protein, label: {Text("protein (g)")}).numberInputValidation($protein).frame(width: 100)
//            Text("protein (g)").italic()
//            Spacer()
//        }
//        Text("Total Calories: \(String(format: "%.2f", calculateCalories(fat: fat, carbs: carbs, protein: protein))) kCal")
//    }
//}
