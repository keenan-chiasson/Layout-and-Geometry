//
//  ContentView.swift
//  Layout and Geometry
//
//  Created by Keenan Chiasson on 8/7/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // Color is a view that will fill entire screen
        Color.red
        
        // Background is the parent
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding(20)
        .background(.red)
        
        // Padding is the parent
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .background(.red)
        .padding(20)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
