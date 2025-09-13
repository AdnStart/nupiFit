//
//  File.swift
//  nupiFit
//
//  Created by Andres Rojas on 09.09.25.
//

import Foundation
import SwiftData

@Model
class ChoiceOfUnits {
    var unit: String
    
    init(unit: String) {
        self.unit = unit
    }
}
