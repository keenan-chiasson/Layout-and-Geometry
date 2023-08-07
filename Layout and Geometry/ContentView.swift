//
//  ContentView.swift
//  Layout and Geometry
//
//  Created by Keenan Chiasson on 8/7/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        // Default - Center aligned
//        Text("Live long and prosper")
//            .frame(width: 300, height: 300)
        
        // Custom alignment
        Text("Live long and prosper")
            .frame(width: 300, height: 300, alignment: .topLeading)
            
        // Centered by default
//        HStack {
//            Text("Live")
//                .font(.caption)
//            Text("long")
//            Text("and")
//                .font(.title)
//            Text("prosper")
//                .font(.largeTitle)
//        }
        
        // Attempt to align by edge, but views have different baselines
//        HStack(alignment: .bottom) {
//            Text("Live")
//                .font(.caption)
//            Text("long")
//            Text("and")
//                .font(.title)
//            Text("prosper")
//                .font(.largeTitle)
//        }
        
        // Instead, better to align w/ unified baseline
        HStack(alignment: .lastTextBaseline) {
            Text("Live")
                .font(.caption)
            Text("long")
            Text("and")
                .font(.title)
            Text("prosper")
                .font(.largeTitle)
        }
        
        // VStack will align text views, while its frame will center it
        VStack(alignment: .leading) {
            Text("Hello, world!")
            Text("This is a longer line of text")
        }
        .background(.red)
        .frame(width: 400, height: 400)
        .background(.blue)
        
        // By default the .leading alignment guide for a view is...
        // ...its leading alignment guide...
        VStack(alignment: .leading) {
            Text("Hello, world!")
                .alignmentGuide(.leading) { d in d[.leading] }
            Text("This is a longer line of text")
        }
        .background(.red)
        .frame(width: 400, height: 400)
        .background(.blue)
        
        // ...which means we can rewrite it to use
        // the view's trailing edge as its leading guide
        VStack(alignment: .leading) {
            Text("Hello, world!")
                .alignmentGuide(.leading) { d in d[.trailing] }
            Text("This is a longer line of text")
        }
        .background(.red)
        .frame(width: 400, height: 400)
        .background(.blue)
        
        // Can ignore view's dimensions pass into closure
        VStack(alignment: .leading) {
            ForEach(0..<10) { position in
                Text("Number \(position)")
                    .alignmentGuide(.leading) { _ in
                        CGFloat(position) * -10
                    }
            }
        }
        .background(.red)
        .frame(width: 400, height: 400)
        .background(.blue)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
