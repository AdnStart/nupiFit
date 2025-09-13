//
//  nupiFitApp.swift
//  nupiFit
//
//  Created by Andres Rojas on 06.09.25.
//

import SwiftUI
import SwiftData

@main
struct nupiFitApp: App {
    var body: some Scene {
        WindowGroup {
           RootView()
              .modelContainer(for: [FoodItem.self, ChoiceOfUnits.self])
        }
    }
}
