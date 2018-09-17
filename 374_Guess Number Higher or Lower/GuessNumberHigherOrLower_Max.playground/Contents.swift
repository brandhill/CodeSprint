//: Playground - noun: a place where people can play
// https://leetcode.com/problems/guess-number-higher-or-lower/description/

import Foundation
import XCTest

class Solution: XCTestCase  {
    
    func test1() {
        let result = guessNumber(20)
        XCTAssertTrue(result == 13)

    }
    
    func guess(_ n: Int) -> Int {
        return n == 13 ? 0 : n > 13 ? -1 : 1
    }
    
    func guessNumber(_ n: Int) -> Int {
        if guess(n) == 0 {
            return n
        }
        
        var left = 1
        var right = n
        
        while left < right {
            let mid = left + (right - left) / 2
            let target = guess(mid)

            if target == 0 {
                return mid
            } else if target == 1{
                left = mid
            } else {
                right = mid
            }
        }
        return left
    }
    
    
}

Solution.defaultTestSuite.run()
