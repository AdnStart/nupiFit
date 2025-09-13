//
//  Food.swift
//  nupiFit
//
//  Created by Andres Rojas on 06.09.25.
//

import Foundation
import SwiftData

@Model
class FoodItem: Identifiable {
    var id: UUID = UUID()
    var name: String
    var brand: String
    var fat: Double
    var carbs: Double
    var protein: Double
    var basePortionQuantity: Double
    var basePortionUnit: String
    var basePortionSIQuantity: Double?
    var basePortionSIUnit: String?
    
    var kcal: Double {
        fat * 9 + carbs * 4 + protein * 4
    }
    
    init(name: String, brand: String, fat: Double = 0, carbs: Double = 0, protein: Double = 0, basePortionQuantity: Double, basePortionUnit: String, basePortionSIQuantity: Double? = nil, basePortionSIUnit: String? = nil) {
        self.name = name
        self.brand = brand
        self.fat = fat
        self.carbs = carbs
        self.protein = protein
        self.basePortionQuantity = basePortionQuantity
        self.basePortionUnit = basePortionUnit
        
        if basePortionSIQuantity == nil {
            self.basePortionSIQuantity = basePortionQuantity
        }
        
        if basePortionSIUnit == nil {
            self.basePortionSIUnit = basePortionUnit
        }
        
        self.basePortionSIQuantity = basePortionSIQuantity
        self.basePortionSIUnit = basePortionSIUnit
    }
    
}
