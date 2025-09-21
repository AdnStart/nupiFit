//
//  AddUnitsSheetView.swift
//  nupiFit
//
//  Created by Andres Rojas on 14.09.25.
//

import SwiftUI
import SwiftData

struct AddUnitsSheetView: View {
    
    @Environment(\.modelContext) private var context
    @State private var enteredText: String = ""
    @State private var duplicateAlert: Bool = false
    @State private var nilInputAlert: Bool = false
    @Binding var sheetIsVisible: Bool
    @Query var units: [ChoiceOfUnits]
    
    
    var body: some View {
        
        VStack {
            HStack {
                Spacer()
                Button {
                    sheetIsVisible = false
                } label: {
                    Text("Done")
                }
            }.padding()
            Spacer()
            HStack {
                TextField("Enter Unit", text: $enteredText)
                Button {
                    let newUnitInput = ChoiceOfUnits(unit: enteredText)
                    newUnitInput.unit = newUnitInput.unit.replacingOccurrences(of: " ", with: "")
                    var existingUnits: [String] = []
                    for item in units {
                        existingUnits.append(item.unit)
                    }
                    print(existingUnits)
                    if existingUnits.contains(newUnitInput.unit) {
                        duplicateAlert = true
                        print("Déjà là!")
                    } else if newUnitInput.unit.isEmpty {
                        nilInputAlert = true
                    } else {
                        print("à insérer :", newUnitInput.unit)
                        context.insert(newUnitInput)
                    }
                    enteredText = ""
                } label: {
                    Text("Add")
                }
                .alert("Value already exists", isPresented: $duplicateAlert) {}
                .alert("You need to enter a value", isPresented: $nilInputAlert) {}
            }
            .padding()
            .overlay {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(.black)
            }
            .padding(40)
            List (units) { unit in Text(unit.unit)
            }
            Spacer()
        }
        
    }
}

#Preview {
    //    AddUnitsSheetView()
    AddUnitsSheetView(sheetIsVisible: .constant(true))
}
