//
//  ContentView.swift
//  Roam_MVP
//
//  Created by Alvin Abraham on 20/5/24.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        LocationsListView(locations: LocationDetailModel.samples)
    }
}

#Preview {
    ContentView()
}
