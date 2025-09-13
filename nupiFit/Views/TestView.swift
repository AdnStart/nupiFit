//
//  TestView.swift
//  nupiFit
//
//  Created by Andres Rojas on 10.09.25.
//

import SwiftUI
import SwiftData

struct TestView: View {
    
    @Environment(\.modelContext) private var context
//    @State var textFieldEntry = ""
//    @State var pickerSelection: String = ""
    var hurrays = ["m", "g", "mL", "L"]
    @Query var allUnits: [ChoiceOfUnits]
    
    var body: some View {
//        HStack {
//            TextField("Placeholder", text: $textFieldEntry).frame(width: 100, height: 30)
//            Picker("Units", selection: $pickerSelection) {
//                ForEach(hurrays, id: \.self) { item in
//                    Text(item)
//                        .onTapGesture {
//                            print("tapped \(item)")
//                        }
//                }
//            }
//        }.padding()
        ForEach(allUnits , id: \.self.unit ){ hurray in
            Text(hurray.unit)
        }
    }
}

#Preview {
    TestView()
}
