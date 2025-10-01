//
//  TypeIcons.swift
//  nupiFit
//
//  Created by Andres Rojas on 21.09.25.
//

import SwiftUI

public enum TypeIcons: String, CaseIterable {
    case manufactured  = "cart"
    case natureProduct = "carrot"
    case selfPrepared  = "frying.pan"
    
    var color: Color {
        switch self {
        case .manufactured:
            return .blue
        case .natureProduct:
            return .green
        case .selfPrepared:
            return .indigo
        }
    }
}

