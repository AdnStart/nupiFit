//
//  ContentView.swift
//  nupiFit
//
//  Created by Andres Rojas on 06.09.25.
//

import SwiftUI

struct RootView: View {
    var body: some View {
        TabView {
            Tab("AddUnits", systemImage: "plus") {
                AddUnitsView()
            }
            Tab("Testing", systemImage: "testtube.2") {
<<<<<<< Updated upstream
                TestView()
=======
                TestView2()
            }
            Tab("Settings", systemImage: "carrot") {
                FoodItemsListView()
            }
            Tab("Settings", systemImage: "gearshape") {
                SettingsView()
>>>>>>> Stashed changes
            }
        }
    }
}

#Preview {
    RootView()
}
