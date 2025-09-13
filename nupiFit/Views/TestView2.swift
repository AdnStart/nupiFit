//
//  TestView2.swift
//  nupiFit
//
//  Created by Andres Rojas on 11.09.25.
//

import SwiftUI

struct TestView2: View {
    
    var arrayOfChoices = [ChoiceOfUnits(unit: "metre"), ChoiceOfUnits(unit: "litres"), ChoiceOfUnits(unit: "kilometre")]
    
    var body: some View {
        List(arrayOfChoices, id: \.self.unit) { choice in
            Text(choice.unit)
        }
    }
}

#Preview {
    TestView2()
}
