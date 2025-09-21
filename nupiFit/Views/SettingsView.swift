//
//  SettingsView.swift
//  nupiFit
//
//  Created by Andres Rojas on 13.09.25.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        VStack{
            Text("Settings")
        }
        NavigationStack {
            List{
                NavigationLink("Units") {UnitsListView()}
                Text("Placeholder")
            }
            
        }.navigationTitle("Settings")
    }
}


#Preview {
    SettingsView()
}
