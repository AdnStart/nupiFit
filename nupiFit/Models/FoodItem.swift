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
    var typeIcon: String
    var fat: Double
    var carbs: Double
    var protein: Double
    var kcal:Double
    var basePortionQuantity: Double
    var basePortionUnit: String
    var basePortionSIQuantity: Double?
    var basePortionSIUnit: String?
    
    init(name: String, brand: String, typeIcon: String, basePortionQuantity: Double, basePortionUnit: String, fat: Double = 0, carbs: Double = 0, protein: Double = 0, kcal: Double = 0, basePortionSIQuantity: Double? = nil, basePortionSIUnit: String? = nil) {
        self.name = name
        self.brand = brand
        self.typeIcon = typeIcon
        self.fat = fat
        self.carbs = carbs
        self.protein = protein
        self.kcal = kcal
        self.basePortionQuantity = basePortionQuantity
        self.basePortionUnit = basePortionUnit
        self.basePortionSIQuantity = basePortionSIQuantity
        self.basePortionSIUnit = basePortionSIUnit
        
        //we set only macros to get kcal, kcal is unchanged
        if (self.fat != 0 || self.carbs != 0 || self.protein != 0) && self.kcal == 0 {
            self.kcal = self.fat * 9 + self.carbs * 4 + self.protein * 4
        }
        
        if self.basePortionSIQuantity == nil {
            self.basePortionSIQuantity = self.basePortionQuantity
        }
        
        if self.basePortionSIUnit == nil || self.basePortionSIUnit == "" {
            self.basePortionSIUnit = self.basePortionUnit
        }
        
    }
}
