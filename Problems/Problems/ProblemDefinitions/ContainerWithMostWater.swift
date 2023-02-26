// ContainerWithMostWater
// From: https://leetcode.com/problems/container-with-most-water/

/// Take aways
/// - Optimal solution needed one algorithmic observation: that iteration could 
///   be shortened by one at each step. IDK how to make that observation, though.
/// - Study Swift style in practice to know when to use guard, and multiple var decls
///   for one var keyword
/// - Capture trust-level as 1, 2, or 3 for most trusted when inventing / assuming /
///   analyzing computation hypotheses. 
/// Nick swift concept / learnings
/// - min == min() and array.min()
/// - max == same
/// - for loop iterating through array with no index == "for X in <range>"
///   - <range> == INT1...INT2 == inclusive
///   - <range> == INT1..<INT2 == excluding last. This offers most C-like behavior.
///   - <range> == ..<INT2 == to negative infinity
///   - <range> == INT1... == to positive infinity
/// - array length == "count", so array.count
/// - brackets are required == "for BLA {...}", "if BLA {...}"
/// - no implicit "return"
class ContainerWithMostWater {
    /// Ridiculously large search space
    static func containerWithMostWater() {
        let height = [1,8,6,2,5,4,8,3,7]
        
        print("Running ...")
        let result = ContainerWithMostWater().maxArea(height)
        print("Result \(result) - should be 49")
    }
    
    // e.g
    //   height = [3, 4, 5]
    //   n = 3
    // transcribe
    // (i, 0), (i, height[i])
    //   e.g.
    //   (0, 0), (0, 3)
    //   (1, 0), (1, 4)
    //   (2, 0), (2, 5)
    // analyze
    // area = min(h1, h2) x abs(i(h1) - i(h2))
    // can contain 100,000 elements
    func maxArea(_ height: [Int]) -> Int {
        // optimizations
        //   let hi = height[i] // Optimize array access => no impact
        //   start 'j' later, at i+1, avoiding duplicated => no impact, keeping it
        //
        // fails - still times out
        // give up - use other person's solution

        return maxAreaSolutionFromAnotherPerson(height)
    }

    /// Solution from other user
    ///   https://leetcode.com/problems/container-with-most-water/solutions/1144091/accepted-solution-for-swift/?languageTags=swift
    /// Observations
    /// - [STYLE, ALG] "guard" to early return for small inputs
    /// - [STYLE] inline brackets for "guard else" statement
    /// - [STYLE] multiple "var" decls on one line 
    /// - [STYLE, BEST_PRACTICE] names use visual themes to better convey meaning
    /// - [ALG, OPT] simpler computation, only uses "min()" and "max()". 
    ///   No "abs()" usage. Unnecessary. Asserts that larger indicies are always 
    ///   larger for the purposes of subtraction. 
    /// - [BEST_PRACTICE] My early assumption about the computation approach
    ///   was overlooked as an area to optimize during my 1 hour of optimization 
    ///   efforts. See <Take aways>.
    /// - [ALG] reduces iteration iteratively, based upon the apparent lemma that
    ///   larger outer elements are more worthy of exploring, and smaller elements
    ///   can safely be ignored quickly.
    /// - [STYLE, BEST_PRACTICE] simplifies an "if x < y then x = y" using "x = max(x,y)"
    /// - [STYLE] inlines calls to like-functions, "max()" wraps a call to "min()"
    /// Take aways
    /// - Optimal solution needed one algorithmic observation: that iteration could 
    ///   be shortened by one at each step. IDK how to make that observation, though.
    /// - Study Swift style in practice to know when to use guard, and multiple var decls
    ///   for one var keyword
    /// - Capture trust-level as 1, 2, or 3 for most trusted when inventing / assuming /
    ///   analyzing computation hypotheses. 
    func maxAreaSolutionFromAnotherPerson(_ h: [Int]) -> Int {
        guard h.count > 2 else { return min(h[0], h[1]) }
        var val = 0, lhs = 0, rhs = h.count - 1
        while lhs < rhs {
            val = max(val, min(h[lhs], h[rhs]) * (rhs - lhs))
            h[lhs] < h[rhs] ? (lhs += 1) : (rhs -= 1)
        }
        return val
    }

    /// Aborted optimization, by me. Still takes too long.
    func maxAreaGiveUp(_ height: [Int]) -> Int {
        var largest = 0
        let len = height.count
        for i in 0..<len - 1 {
            let hi = height[i]
            for j in i + 1..<len {
                let current = min(hi, height[j]) * abs(i - j)
                if current > largest {
                    largest = current
                }
            }
        }
        return largest
    }

    /// Solves the problem for small input arrays. Fails for large arrays due to time-out.
    /// Writing time: 20m 
    func maxAreaTrivial(_ height: [Int]) -> Int {
        var largest = 0
        let len = height.count
        for i in 0..<len - 1 {
            for j in 1..<len {
                let current = min(height[i], height[j]) * abs(i - j)
                if current > largest {
                    largest = current
                }
            }
        }
        return largest
    }
}
