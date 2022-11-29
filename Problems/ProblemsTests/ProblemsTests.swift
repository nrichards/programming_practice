//
//  ProblemsTests.swift
//  ProblemsTests
//
//  Created by Nicholas Richards on 11/21/22.
//

@testable import Problems
import XCTest

final class ProblemsTests: XCTestCase {
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInsertSymbols() throws {
        // Given
        let test1: String = "The time is high and I'm number one\n3\n0 10\n11 5\n20 5"

        // When, then
        InsertSymbols.doTest(test: test1)
    }

    func testCheckPermutation() throws {
        // Given
        let testCases = [
            (strA: "ring", strB: "ingr", result: true),
            (strA: "burger", strB: "burg", result: false),
            (strA: "zits", strB: "zats", result: false),
            (strA: "burger", strB: "burg", result: false),
        ]

        // When
        for (strA, strB, result) in testCases {
            XCTContext.runActivity(named: "Checking \(strA) vs. \(strB). Expecting \(result)") { _ in
                // Then
                XCTAssert(CheckPermutation.doTest(a: strA, b: strB) == result)
            }
        }
    }

    func testPalindromePermutation() throws {
        // Given
        let testCases = [
            (input: "Tact Coa", expected: true),
            (input: "badfasdfddd", expected: false),
            (input: "UIOPUIOP", expected: true),
            (input: "NJOIUNJOIUNJOIU", expected: false),
            (input: "UDUDU", expected: true),
        ]

        // When
        for (input, expected) in testCases {
            XCTContext.runActivity(named: "Checking \(input). Expecting \(expected)") { _ in
                let (testResult, _) = PalindromePermutation.doTest(palindrome: input)

                // Then
                XCTAssert(testResult == expected)
            }
        }
    }

    func testSpiralMatrix() throws {
        // Given
        let testCases = [
            (input: [[1, 0, 5, 4, 3], [3, 2, 1, 0, 5], [6, 2, 3, 9, 7]], expected: [1, 0, 5, 4, 3, 5, 7, 9, 3, 2, 6, 3, 2, 1, 0]),
            (input: [[1,2],[4,3]], expected: [1, 2, 3, 4]),
        ]

        // When
        for (input, expected) in testCases {
            XCTContext.runActivity(named: "Checking \(input). Expecting \(expected)") { _ in
                let testResult = SpiralMatrix.doTest(mnArray: input)

                // Then
                XCTAssert(testResult == expected)
            }
        }
    }
}
