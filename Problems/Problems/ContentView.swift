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
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            Spacer()
            Button(action: InsertSymbols.insertSymbols) {
                Text("Insert Symbols")
            }
            Button(action: CheckPermutation.checkPermutation) {
                Text("Check Permutation")
            }
            Button(action: PalindromePermutation.palindromePermutation) {
                Text("Palindrome Permutation")
            }
            Button(action: AnimalShelter.demo) {
                Text("Animal Shelter")
            }
            Spacer()

        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
