//
//  AddUnitView.swift
//  nupiFit
//
//  Created by Andres Rojas on 09.09.25.
//

import SwiftUI
import SwiftData

struct AddUnitsView: View {
    
    @Environment(\.modelContext) private var context
    @State var newUnitEntry: String = ""
    @State private var duplicateAlert: Bool = false
    @State private var nilInputAlert: Bool = false
    @Query var units: [ChoiceOfUnits]
    
    var body: some View {
        VStack {
            List(units, id: \.self.unit) { unit in
                Text(unit.unit)
                    .swipeActions {
                        Button("Delete", systemImage: "trash") {
                            context.delete(unit)
                        }.tint(.red)
                    }
            }
            HStack {
                TextField("Enter unit", text: $newUnitEntry).frame(width: 100)
                    .toolbar {
                        ToolbarItemGroup(placement: .keyboard) {
                            Spacer()
                            HStack {
                                Button("Add") {
                                    let newUnitInput = ChoiceOfUnits(unit: newUnitEntry)
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
                                    newUnitEntry = ""
                                }
                            }
                        }
                    }
                    .alert("Value already exists", isPresented: $duplicateAlert) {}
                    .alert("You need to enter a value", isPresented: $nilInputAlert) {}
            }
        }
    }
}


#Preview {
    AddUnitsView()
}
