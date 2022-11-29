//
//  ContentModel.swift
//  Problems
//
//  Created by Nicholas Richards on 11/23/22.
//

import Foundation

struct Problem: Identifiable {
    var action: () -> Void
    var name: String
    var id: String { name }
}

struct Problems {
    static var problems = [
        Problem(action: InsertSymbols.insertSymbols,
                name: "Insert Symbols"),
        Problem(action: CheckPermutation.checkPermutation,
                name: "Check Permutation"),
        Problem(action: PalindromePermutation.palindromePermutation,
                name: "Palindrome Permutation"),
        Problem(action: AnimalShelter.demo,
                name: "Animal Shelter"),
        Problem(action: SpiralMatrix.spiralMatrix,
                name: "Spiral Matrix"),

    ]
}
