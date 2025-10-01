//
//  TestView3.swift
//  nupiFit
//
//  Created by Andres Rojas on 20.09.25.
//

import SwiftUI
import SwiftData

struct TestView3: View {
    
    @Environment(\.modelContext) private var context
    @State var sheetIsVisible: Bool = false
    @Query var allUnits: [ChoiceOfUnits]
    private var simpleArray: [String] = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j"]
    
    var body: some View {
        
        List(allUnits, id: \.self.unit) { unitObject in
            Text(unitObject.unit)
        }
//        List(simpleArray, id: \.self) { item in
//            Text(item)
//        }
        
    }
}

#Preview {
    TestView3()
}
