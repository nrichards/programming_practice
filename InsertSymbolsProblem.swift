//
//  InsertSymbolsProblem.swift
//  InsertSymbolsProblem
//
//  Created by Nicholas Richards on 11/17/22.
//

import Foundation

func insertSymbols() {
    // Given input data insert '.' in text according to block positions and lengths

    // Data format
    // TEXT_STRING
    // BLOCK_COUNT_INT
    // BLOCK_START_INT BLOCK_LENGTH_INT

    let test1: String = """
TESTINGWHETHERTHINGSLOOKNICE
2
3 4
5 6
"""

    let test2: String = """
The time is high and I'm number one
3
0 10
11 5
20 5
"""

    print("==BEGIN==")

    for test in [test1, test2] {
        print("***")
        doTest(test: test)
    }
    print("==END==")
}

func doTest(test: String) {
    // Extract the text, and blocks
    
    let parts = test.split(separator: "\n")
    let text = parts[0]
    let blockCount = Int(parts[1])
    let blocks = parts[2...]

    var textPointer = text.startIndex
    var result: String = ""

    for block in blocks {
        var scalars = block.split(whereSeparator: { $0.isWhitespace })
        let start = Int(scalars[0])!
        let len = Int(scalars[1])!
        
        let end = text.index(textPointer, offsetBy: start)
        result += text[textPointer ... end]
        textPointer = end
        
        result += String(repeating: ".", count: len)
    }
    
    // Last bit.
    // Get index of the last-read
    
    result += text[textPointer ... text.index(before:text.endIndex)]

    print(result)
}
