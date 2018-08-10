// 345. Reverse Vowels of a String
// https://leetcode.com/problems/reverse-vowels-of-a-string/

import Foundation
import XCTest

class Solution: XCTestCase {
    
    func test1() {
        XCTAssertTrue(reverseVowels("hello") == "holle")
    }
    
    func test2() {
        XCTAssertTrue(reverseVowels("leetcode") == "leotcede")
    }
    
    func test3() {
        XCTAssertTrue(reverseVowels("aA") == "Aa")
    }
    
    func reverseVowels(_ s: String) -> String {
        
        var stack: [Character] = []
        var tmp: [Character] = []
        var result: [Character] = []
        
        for c in s {
            if  c == "a" || c == "e" || c == "i" || c == "o" || c == "u" ||
                c == "A" || c == "E" || c == "I" || c == "O" || c == "U"  {
                stack.append(c)
                tmp.append("_")
            }else{
                tmp.append(c)
            }
        }
        
        for c in tmp {
            if c == "_" {
                let pop = stack.removeLast()
                result.append(pop)
            }else{
                result.append(c)
            }
        }
        return String(result)
    }
}

Solution.defaultTestSuite.run()
