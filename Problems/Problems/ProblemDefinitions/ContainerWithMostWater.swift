// ContainerWithMostWater
// From: https://leetcode.com/problems/container-with-most-water/

class ContainerWithMostWater {
    // height = [3, 4, 5]
    // n = 3
    // (i, 0), (i, height[i])
    // (0, 0), (0, 3)
    // (1, 0), (1, 4)
    // (2, 0), (2, 5)
    // area = min(h1, h2) x abs(i(h1) - i(h2))
    func maxArea(_ height: [Int]) -> Int {
        // Nick swift concepts
        // min == min() and array.min()
        // max == same
        // for loop iterating through array with no index == "for X in <range>"
        //   <range> == INT1...INT2 == inclusive
        //   <range> == INT1..<INT2 == excluding last
        //   <range> == ..<INT2 == to negative infinity
        //   <range> == INT1... == to positive infinity
        // array length == "count", so array.count
        // brackets are required == "for BLA {...}", "if BLA {...}"
        // no implicit "return"
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
