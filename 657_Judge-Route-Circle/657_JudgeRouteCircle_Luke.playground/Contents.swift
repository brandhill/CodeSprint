//: Playground - noun: a place where people can play

import UIKit
import XCTest

class Solution: XCTestCase {
    
    func judgeCircle(_ moves: String) -> Bool {
        var leftCount = 0
        var rightCount = 0
        var upCount = 0
        var downCount = 0
        var otherCount = 0
        
        for char in moves.uppercased() {
            switch char {
            case "L":
                leftCount = leftCount + 1
            case "R":
                rightCount = rightCount + 1
            case "U":
                upCount = upCount + 1
            case "D":
                downCount = downCount + 1
            default:
                otherCount = otherCount + 1
            }
        }
        
        if(otherCount != 0) {
            return false
        }
        else {
            return (upCount == downCount) && (leftCount == rightCount)
        }
    }
    
    func testUpThenDown() {
        let result = judgeCircle("UD")
        XCTAssert(result, "Result testUpThenDown should be ture")
    }
    
    func testLeftTwice() {
        let result = judgeCircle("LL")
        XCTAssert(!result, "Result testUpThenDown should be Flase")
    }
}

Solution.defaultTestSuite.run()
