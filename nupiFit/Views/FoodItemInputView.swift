//
//  FoodDetailView.swift
//  nupiFit
//
//  Created by Andres Rojas on 06.09.25.
//

import SwiftUI
import SwiftData

struct FoodItemInputView: View {
    
    @Environment(\.modelContext) private var context
    @FocusState private var isFocusedField: focusFields?
    @State private var incompleteFieldsAlert: Bool = false
    @State private var savedConfirmationAlert: Bool = false
    @State private var name: String = ""
    @State private var brand: String = ""
    @State private var typeIcon: TypeIcons = .manufactured
    @State private var fat: String = ""
    @State private var carbs: String = ""
    @State private var protein: String = ""
    @State private var portionAmount: String = ""
    @State private var portionUnit: String = ""
    @State private var portionAmountSI: String = ""
    @State private var portionUnitSI: String = ""
    @Query var units: [ChoiceOfUnits]
    
    private enum focusFields: Hashable {
        case fieldName, fieldBrand, fieldAmount, fieldFat, fieldCarbs, fieldProtein
    }
    
    private enum TypeIcons: String, CaseIterable {
        case manufactured  = "cart"
        case natureProduct = "carrot"
        case selfPrepared  = "frying.pan"
    }
    
    
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button {
                    if name.isEmpty || brand.isEmpty || portionAmount.isEmpty || portionUnit.isEmpty || (protein.isEmpty && carbs.isEmpty && fat.isEmpty) {
                        incompleteFieldsAlert = true
                    } else {
                        let foodItem = FoodItem(name: name, brand: brand, typeIcon: typeIcon.rawValue, basePortionQuantity: castStringToDouble(portionAmount)!, basePortionUnit: portionUnit, fat: castStringToDouble(fat) ?? 0, carbs: castStringToDouble(carbs) ?? 0, protein: castStringToDouble(protein) ?? 0, basePortionSIQuantity: castStringToDouble(portionUnitSI), basePortionSIUnit: portionUnitSI)
                        context.insert(foodItem)
                        name = ""
                        brand = ""
                        typeIcon = .manufactured
                        fat = ""
                        carbs = ""
                        protein = ""
                        portionAmount = ""
                        portionUnit = ""
                        portionAmountSI = ""
                        portionUnitSI = ""
                    }
                } label: {
                    Text("Save")
                }.padding()
                    .alert(isPresented: $incompleteFieldsAlert) {
                        Alert(title: Text("Missing mandatory fields"))
                    }
                    .alert(isPresented: $savedConfirmationAlert) {
                        Alert(title: Text("Saved!"))
                    }
            }
            Image (systemName: "carrot")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 130, height: 130)
                .foregroundStyle(.purple)
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                .padding(.bottom)
            Form {
                HStack {
                    Text("Name").foregroundStyle(.secondary)
                    TextField ("Name", text: $name).focused($isFocusedField, equals: .fieldName)
                }
                HStack {
                    Text("Brand").foregroundStyle(.secondary)
                    TextField("Brand", text: $brand).focused( $isFocusedField, equals: .fieldBrand)
                }
                Picker("Icon", selection: $typeIcon) {
                    ForEach (TypeIcons.allCases, id: \.self.rawValue) { icon in
                        Image(systemName: icon.rawValue).tag(icon.rawValue)
                    }
                }.foregroundStyle(.secondary).tint(.black)
                HStack {
                    Text("Portion amount").foregroundStyle(.secondary)
                    TextField ("(custom)", text: $portionAmount)
                        .numberInputValidation($portionAmount)
                        .keyboardType(.decimalPad)
                        .focused( $isFocusedField, equals: .fieldAmount)
                        .tint(.secondary)
                }
                Picker("Unit", selection: $portionUnit) {
                    ForEach (units, id: \.self.unit) { unitObject in
                        Text(unitObject.unit)
                    }
                }.foregroundStyle(.secondary).tint(.black)
                HStack {
                    Text("Amount in SI").foregroundStyle(.secondary)
                    TextField("(optional)", text: $portionAmountSI)
                }
                Picker("SI unit (optional)", selection: $portionUnitSI) {
                    ForEach (units, id: \.self.unit) { unitObject in
                        Text(unitObject.unit)
                    }
                }.foregroundStyle(.secondary).tint(.black)
                HStack {
                    Text("Fat").foregroundStyle(.secondary)
                    TextField(text: $fat, label: {Text("fat")})
                        .numberInputValidation($fat)
                        .keyboardType(.decimalPad)
                        .focused( $isFocusedField, equals: .fieldFat)
                }
                HStack {
                    Text("Carbs").foregroundStyle(.secondary)
                    TextField(text: $carbs, label: {Text("carbs")})
                        .numberInputValidation($carbs)
                        .keyboardType(.decimalPad)
                        .focused( $isFocusedField, equals: .fieldCarbs)
                }
                HStack {
                    Text("Protein").foregroundStyle(.secondary)
                    TextField(text: $protein, label: {Text("protein")})
                        .numberInputValidation($carbs)
                        .keyboardType(.decimalPad)
                        .focused( $isFocusedField, equals: .fieldProtein)
                }
                Text("Total Calories: \(String(format: "%.2f", calculateCalories(fat: fat, carbs: carbs, protein: protein))) kCal")
            }
            .toolbar(content: {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button {
                        if let currentFocusedField = isFocusedField {
                            switch currentFocusedField {
                            case .fieldName:
                                isFocusedField = .fieldBrand
                            case .fieldBrand:
                                isFocusedField = .fieldAmount
                            case .fieldAmount:
                                isFocusedField = .fieldFat
                            case .fieldFat:
                                isFocusedField = .fieldCarbs
                            case .fieldCarbs:
                                isFocusedField = .fieldProtein
                            default:
                                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                            }
                        }
                    } label: {
                        Text("Next")
                    }
                    Button {
                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                    } label: {
                        Image(systemName: "keyboard.chevron.compact.down")
                    }
                    
                }
            })
            
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
    FoodItemInputView()
}
