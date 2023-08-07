//
//  ContentView.swift
//  Layout and Geometry
//
//  Created by Keenan Chiasson on 8/7/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // absolute positioning
        Text("Hello, world!")
            .position(x: 100, y: 100)
        
        // red background tightly fits
        Text("Hello, world!")
            .background(.red)
            .position(x: 100, y: 100)
        
        // position provides new view that takes all available space
        Text("Hello, world!")
            .position(x: 100, y: 100)
            .background(.red)
        
        // remember the 3-step layout process of SwiftUI
        // 1. Parent view proposes a size for its child
        // 2. Child chooses its size, parent must respect choice
        // 3. Parent positions child in its coordinate space
        
        // the .offset() modifier changes the location
        // of where a view should be rendered,
        // but does NOT actually change its underlying geometry
        // .background() uses the orginal position of text, NOT the offset
        Text("Hello, world!")
            .offset(x: 100, y: 100)
            .background(.red)
        
        // this might be more what you'd expect,
        // illustrating MODIFIER ORDER MATTERS
        Text("Hello, world!")
            .background(.red)
            .offset(x: 100, y: 100)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
