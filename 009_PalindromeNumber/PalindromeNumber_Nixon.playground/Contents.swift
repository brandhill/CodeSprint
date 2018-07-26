import Foundation
import XCTest

class Solution: XCTestCase {
    
    func isPalindrome(_ x: Int) -> Bool {
        
        if x < 0 || (x % 10 == 0 && x != 0) { return false }
        
        var reverted = 0
        var temp = x
        
        while temp > reverted {
            reverted = reverted * 10 + temp % 10
            temp /= 10
        }
                
        return temp == reverted || temp == reverted / 10
    }
    
    func testOne() {
        XCTAssertTrue(isPalindrome(121))
    }
    
    func testTwo() {
        XCTAssertFalse(isPalindrome(-121))
    }
    
    func testThree() {
        XCTAssertFalse(isPalindrome(10))
    }
}

Solution.defaultTestSuite.run()
