//
//  NumericInputValidationModifier.swift
//  nupiFit
//
//  Created by Andres Rojas on 08.09.25.
//

import SwiftUI
import Combine

struct NumericInputValidationModifier: ViewModifier {
    
    @Binding var text: String
    
    func body(content: Content) -> some View {
        content
            .onReceive(Just(text)) { newValue in
                
                let regex = /\d+[\.,]{1}\d{0,2}|\d+/
                
                if let match = newValue.firstMatch(of: regex) {
                    let validatedString = String(match.output)
                    self.text = validatedString
                } else {
                    self.text = ""
                }
            }
    }
}

extension View {
    func numberInputValidation(_ text: Binding<String>) -> some View {
        modifier(NumericInputValidationModifier(text: text))
    }
}
