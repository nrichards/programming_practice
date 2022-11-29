//
//  SpiralMatrixGiuseppePiccianoYT.swift
//  Problems
//
//  Created by Nicholas Richards on 11/28/22.
//

import Foundation

/// From https://www.youtube.com/watch?v=_hxAfrslBNw
/// Observations
///  - I'm doing the outer set-up work first, a top-down approach
///  - I also did some initial inner work, but only to enumerate the output by observation, in hopes that I would be inspired to program top-down
///  - I'm burned out, after writing all the outer work
///  - Overwhelmed
/// Conclusions
///  - May want to be honest with self about my initial hope for being inspired. Make note of it not working. Then explicitly change strategy.
///  - May want to try solving the inner most iteration first, to see if that inspire me .. bottom-up
///  - Try solving for a smaller size
///  - Write out in pseudocode how the algorithm should iterate
///  - Identify invariants gleaned from analysis, e.g. "Iteration will always output the current element, and then do a check, and maybe turn right-ward"
///  - Repeat that, building upon conclusions, e.g. "The bounding box of visited rows and columns may shrink."
///  - Use a parameter-object to simplify the cognitive burden of passing state around

struct SpiralMatrix {
    /// Given a two dimensional array, return the inward-iteration, walking the deepest dimension
    /// first, then across the shallowest dimension, then back up the deepest dimension,
    /// then up the shallowest dimension visited.
    /// Ex 1.
    ///  [ [ 1, 2], [3, 4], [5, 6] ] => [1, 2, 4, 6, 5, 3 ]
    /// Ex 2.
    ///  [ [1, 0, 5, 4, 3],
    ///   [3, 2, 1, 0, 5 ],
    ///   [6, 2, 3, 9 7] ]
    ///  => ....
    static func spiralMatrix() {
        let sample: [[Int]] = [[1, 0, 5, 4, 3],
                               [3, 2, 1, 0, 5],
                               [6, 2, 3, 9, 7]]

        let result = doTest(mnArray: sample)
         print("input \(sample) ==> output \(result)")
    }

    enum Direction {
        case east
        case south
        case west
        case north

        // TODO: optimize with rawValue
        func turn() -> Direction {
            switch self {
            case .east:
                return .south // increment min row
            case .south:
                return .west // decrement max col
            case .west:
                return .north // decrement max row
            case .north:
                return .east // increment min col
            }
        }
    }

    /// Represents a M x N matrix. Offers ability to walk the matrix following an inward-bound spiral visitation pattern.
    struct SpiralStep {
        var rowStart: Int
        var rowEnd: Int
        var columnStart: Int
        var columnEnd: Int
        var row: Int
        var column: Int
        var direction: Direction

        /// Mutates the direction and bounding box, according to
        mutating func turnRight() {
            let oldDirection = direction
            direction = direction.turn()
            
            switch oldDirection {
            case .east:
                rowStart += 1
            case .south:
                columnEnd -= 1
            case .west:
                rowEnd -= 1
            case .north:
                columnStart += 1
            }
        }
        
        /// Mutates the current position, according
        mutating func paceForward() {
            switch direction {
            case .east:
                column += 1
            case .south:
                row += 1
            case .west:
                column -= 1
            case .north:
                row -= 1
            }
        }
        
        func needTurn() -> Bool {
            switch direction {
            case .east:
                return column >= columnEnd
            case .south:
                return row >= rowEnd
            case .west:
                return column <= columnStart
            case .north:
                return row <= rowStart
            }
        }
        
        mutating func walk() {
            // Detect end of row / column
            let shouldTurn = needTurn()
            
            // Do the turn
            if shouldTurn {
                // Completed visitation of a row / column

                turnRight()
            }
            
            paceForward()
        }
    }

    static func doTest(mnArray: [[Int]]) -> [Int] {
        let rows = mnArray.count
        let columns = mnArray[0].count
        let count = rows * columns

        var result = [Int](repeating: 0, count: count)

        // Declare initial iteration state

        var step = SpiralStep(
            rowStart: 0, rowEnd: rows - 1,
            columnStart: 0, columnEnd: columns - 1,
            row: 0,
            column: 0,
            direction: Direction.east)

        for index in 0 ..< count {
            // output the current element, as first step
            result[index] = mnArray[step.row][step.column]

            step.walk()
        }

        return result
    }

}
