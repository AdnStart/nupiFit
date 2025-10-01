//
//  TestView2.swift
//  nupiFit
//
//  Created by Andres Rojas on 11.09.25.
//

import SwiftUI
import SwiftData

struct TestView2: View {
    
//    @State private var typeIcon: TypeIcons = .manufactured
    @State private var typeIcon = "frying.pan"
    
<<<<<<< Updated upstream:nupiFit/Views/TestView2.swift
    var body: some View {
        List(arrayOfChoices, id: \.self.unit) { choice in
            Text(choice.unit)
=======
    private var theMemory = ["cart", "carrot", "frying.pan"]
    
    var body: some View {
        HStack {
            Picker("Icon", selection: $typeIcon) {
                ForEach (theMemory, id: \.self) { icon in
                    Image(systemName: icon)
                }
            }.onChange(of: typeIcon) { oldValue, newValue in
                print(oldValue, newValue)
            }
>>>>>>> Stashed changes:nupiFit/Tests/TestView2.swift
        }
    }
}

#Preview {
    TestView2()
}
