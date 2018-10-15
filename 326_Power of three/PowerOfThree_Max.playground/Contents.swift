//: Playground - noun: a place where people can play
// https://leetcode.com/problems/power-of-three/description/


import Foundation
import XCTest

class Solution: XCTestCase  {

    func test1() {
        let result = isPowerOfThree(27)
        XCTAssertTrue(result == true)
    }
    
    func test2() {
        let result = isPowerOfThree2(81)
        XCTAssertTrue(result == true)
    }

    func isPowerOfThree(_ n: Int) -> Bool {
        return n > 0 && (1162261467 % n == 0);
    }

    func isPowerOfThree2(_ n: Int) -> Bool {
        
        if n == 0 {
            return false
        }
        var i = (log10(Double(n)) / log10(Double(3)))
        return i.rounded() == i
    }

}

Solution.defaultTestSuite.run()

