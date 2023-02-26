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
        // for loop iterating through array with no index == 
        // array length == "count", so array.count
        var largest = 0
        let len = height.count
        for i = 0, len - 2
            for j = 1, len - 1
                let current = min(height[0], height[1]) * abs(0 - 1)
                if current > largest
                    largest = current
    }
}
