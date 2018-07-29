import Foundation
import XCTest

class Solution: XCTestCase {
    
    func missingNumber(_ nums: [Int]) -> Int {
        
        var missing = nums.count
        for i in 0..<(nums.count) {
            missing ^= i ^ nums[i]
        }
        return missing
    }
    
    func testOne() {
        let result = missingNumber([0,1,2,3,5])
        XCTAssertTrue(result == 4)
    }
    
    func testTwo() {
        let result = missingNumber([0])
        XCTAssertTrue(result == 1)
    }
    
    func testThree() {
        let result = missingNumber([1])
        XCTAssertTrue(result == 0)
    }
    
    func testFour() {
        let result = missingNumber([0,1,2,3,4])
        XCTAssertTrue(result == 5)
    }
}

Solution.defaultTestSuite.run()
