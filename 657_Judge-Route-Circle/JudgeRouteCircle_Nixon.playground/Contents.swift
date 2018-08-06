// 657. Judge Route Circle
// https://leetcode.com/problems/judge-route-circle/

import Foundation
import XCTest

class Solution: XCTestCase  {
    
    func test1() {
        XCTAssertTrue(judgeCircle("UD"))
    }
    
    func test2() {
        XCTAssertFalse(judgeCircle("LL"))
    }
    
    func test3() {
        XCTAssertTrue(judgeCircle("LR"))
    }
    
    func test4() {
        XCTAssertTrue(judgeCircle("UDLR"))
    }
    
    func test5() {
        XCTAssertTrue(judgeCircle("UUDDLLRR"))
    }
    
    func judgeCircle(_ moves: String) -> Bool {
        
        var dic: [Character: Int] = [:]
        
        for c in moves {
            if let value = dic[c] {
                dic[c] = value + 1
            }else{
                dic[c] = 1
            }
        }
        
        return dic["U"] == dic["D"] && dic["L"] == dic["R"]
    }
}

Solution.defaultTestSuite.run()
