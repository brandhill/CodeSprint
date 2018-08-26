//: https://leetcode.com/problems/plus-one/description/
//: O(n)


import Foundation
import XCTest

class Solution: XCTestCase {
    func plusOne(_ digits: [Int]) -> [Int] {
        
        if digits.count == 0 {
            return digits
        }
        var result = digits

        for index in (0..<result.count).reversed() {
            
            if result[index] == 9 {
                result[index] = 0
            }
            else {
                result[index] = result[index] + 1
                return result
            }
        }
        
        if let first = result.first {
            if first == 0 {
                result.insert(1, at: 0)
            }
        }
        
        return result
    }
    
    func testIn123Out124() {
        let input = [1, 2, 3]
        let assert = [1, 2, 4]
        
        let result = plusOne(input)
        XCTAssert(result == assert, "Result should be [1, 2, 4]")
    }
    
    func testIn4321Out4322() {
        let input = [4, 3, 2, 1]
        let assert = [4, 3, 2, 2]
        
        let result = plusOne(input)
        XCTAssert(result == assert, "Result should be [4, 3, 2, 2]")
    }
    
    func testIn9Out10() {
        let input = [9, 9]
        let assert = [1, 0, 0]
        
        let result = plusOne(input)
        XCTAssert(result == assert, "Result should be [1, 0, 0]")
    }
}

Solution.defaultTestSuite.run()
