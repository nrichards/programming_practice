//
//  PalindromePermutation.swift
//  Problems
//
//  Created by Nicholas Richards on 11/21/22.
//

import Foundation

struct PalindromePermutation {
    /// Given a string, write a function to check if it is a permutation of a palindrome.
    ///  A palindrome is a word or phrase that is the same forwards and backwards.
    ///  A permutation is a rearrangement of letters.
    ///  The palindrome does not need to be limited to just dictionary words.
    ///  You can ignore casing and non-letter characters.
    static func palindromePermutation() {
        let test = "Tact Coa"
        // Expectation: True, "taco cat", "atco cta"

        let (result1, result2) = doTest(palindrome: test)
        print("\(result1) \(result2)")
    }

    static func doTest(palindrome: String) -> (Bool, [String]) {
//        var result: Bool
//        var palindromes: [String] = []

        // lowercase
        // not whitespace
        // count the number of occurrances of a given character

        var d: [Character: Int] = [:]
        palindrome.lowercased().filter { $0.isWhitespace == false }.forEach { character in
            d[character] = d[character] == nil ? 1 : d[character]! + 1
        }

        var foundOdd = false

        // Check for only on odd-numbered non-space character

        for c in d.values {
            if c % 2 == 1 {
                if foundOdd {
                    return (false, [])
                } else {
                    foundOdd = true
                }
            }
        }

        return (true, [])
    }
}
