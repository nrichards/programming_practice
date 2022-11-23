//
//  ContentView.swift
//  Problems
//
//  Created by Nicholas Richards on 11/21/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .asHeader()
            Text("Hello, world!")
            Spacer()
            Problems()
            Spacer()
        }
        .padding()
    }
}

extension Image {
    func asHeader() -> some View {
        imageScale(.large)
            .foregroundColor(.accentColor)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
