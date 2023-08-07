//
//  ContentView.swift
//  Layout and Geometry
//
//  Created by Keenan Chiasson on 8/7/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack(alignment: .midAccountAndName) {
            VStack {
                Text("@thechiassonator")
                    .alignmentGuide(.midAccountAndName) { d in
                        d[VerticalAlignment.center]
                    }
                Image("Example")
                    .resizable()
                    .frame(width: 64, height: 64)
            }
            
            VStack {
                Text("Full name:")
                Text("KEENAN CHIASSON")
                    .alignmentGuide(.midAccountAndName) { d in
                        d[VerticalAlignment.center]
                    }
                    .font(.largeTitle)
            }
        }
    }
}

extension VerticalAlignment {
    enum MidAccountAndName: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[.top]
        }
    }
    
    static let midAccountAndName = VerticalAlignment(MidAccountAndName.self)
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
