//
//  CheckPermutation1.2.swift
//  CodingProblems
//
//  Created by Nicholas Richards on 11/21/22.
//

import Foundation

struct CheckPermutation {
    // Given two strings, write a method to decide if one is a permutation of the other
    static func checkPermutation() {
        let strA : String = "ring"
        let strB : String = "ingr"
        
        let result = doTest(a:strA, b: strB)
        print("Checking \(strA) vs. \(strB): \(result)")
    }
    
    static func doTest(a: String, b: String) -> Bool {
        let aSorted = a.lowercased().sorted()
        let bSorted = b.lowercased().sorted()
        return aSorted == bSorted
    }
}

