//
//  UnitsListView.swift
//  nupiFit
//
//  Created by Andres Rojas on 14.09.25.
//

import SwiftUI
import SwiftData

struct UnitsListView: View {
    
    @Environment(\.modelContext) private var context
    @State var sheetIsVisible: Bool = false
    @Query var allUnits: [ChoiceOfUnits]
    
    var body: some View {
        
        NavigationStack{
            
            List(allUnits , id: \.self.id ) { unitObject in
                Text(unitObject.unit)
                    .swipeActions {
                        Button("Delete", systemImage: "trash") {
                            context.delete(unitObject)
                        }.tint(.red)
                    }
                    .navigationTitle(Text("Units"))
            }
            .toolbar {
                ToolbarItem {
                    Button {
                        sheetIsVisible = true
                    } label: {
                        Image(systemName: "plus")
                    }
                    
                }
            }
        }.sheet(isPresented: $sheetIsVisible) {
            AddUnitsSheetView(sheetIsVisible: $sheetIsVisible)
        }
    }
}

#Preview {
    UnitsListView()
}


//            ForEach(allUnits , id: \.self.unit ){ unitObject in
//                Text(unitObject.unit)
//            }
