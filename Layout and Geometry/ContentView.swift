//
//  ContentView.swift
//  Layout and Geometry
//
//  Created by Keenan Chiasson on 8/7/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // take 90% of all available width regardless of content
        GeometryReader { geo in
            Text("Hello, world!")
                .frame(width: geo.size.width * 0.9)
                .background(.red)
        }
        
        // Side effect: the view that gets returned has a flexible preferred size;
        // meaning it will expand to take up more space as needed
        VStack {
            GeometryReader { geo in
                Text("Hello, world!")
                    .frame(width: geo.size.width * 0.9, height: 40)
                    .background(.red)
            }
            // this green bg shows us just how big it is
            // note: preferred size, NOT absolute
            .background(.green)
            
            // gets pushed to the bottom
            Text("More text")
                .background(.blue)
        }
        
        OuterView()
            .background(.red)
            .coordinateSpace(name: "Custom")
    }
}

struct OuterView: View {
    var body: some View {
        VStack {
            Text("Top")
            InnerView()
                .background(.green)
            Text("Bottom")
        }
    }
}

struct InnerView: View {
    var body: some View {
        HStack {
            Text("Left")
            GeometryReader { geo in
                Text("Center")
                    .background(.blue)
                    .onTapGesture {
                        print("Global center: \(geo.frame(in: .global).midX) x \(geo.frame(in: .global).midY)")
                        print("Custom center: \(geo.frame(in: .named("Custom")).midX) x \(geo.frame(in: .named("Custom")).midY)")
                        print("Local center: \(geo.frame(in: .local).midX) x \(geo.frame(in: .local).midY)")
                    }
            }
            .background(.orange)
            Text("Right")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
