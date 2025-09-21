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
                FoodItemInputView()
            }
            Tab("Testing", systemImage: "testtube.2") {
                TestView2()
            }
            Tab("Settings", systemImage: "carrot") {
                TestView3()
            }
            Tab("Settings", systemImage: "gearshape") {
                SettingsView()
            }
        }
    }
}

#Preview {
    RootView()
}
