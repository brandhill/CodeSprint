//: Playground - noun: a place where people can play
// https://leetcode.com/problems/daily-temperatures/description/


import Foundation
import XCTest

class Solution: XCTestCase  {

    func test1() {
        let result = dailyTemperatures([73, 74, 75, 71, 69, 72, 76, 73])
        XCTAssertTrue(result == [1, 1, 4, 2, 1, 1, 0, 0])
    }

    func dailyTemperatures(_ temperatures: [Int]) -> [Int] {

        var res = temperatures
        if res.count == 0 {
            return res
        }

        var stack = [Int]()

        for i in 0..<temperatures.count {
            while !stack.isEmpty && res[stack.last!] < res[i] {
                let index = stack.popLast()
                res[index!] = i - index!
            }
            stack.append(i)
        }

        while !stack.isEmpty {
            res[stack.popLast()!] = 0
        }

        return res
    }


}

Solution.defaultTestSuite.run()

