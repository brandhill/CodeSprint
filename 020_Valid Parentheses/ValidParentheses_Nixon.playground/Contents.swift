// 20. Valid Parentheses
// https://leetcode.com/problems/valid-parentheses/

import Foundation
import XCTest

class Solution: XCTestCase  {
    
    func test1() {
        XCTAssertTrue(isValid("()"))
    }
    
    func test2() {
        XCTAssertTrue(isValid("()[]{}"))
    }
    
    func test3() {
        XCTAssertFalse(isValid("(]"))
    }
    
    func test4() {
        XCTAssertFalse(isValid("([)]"))
    }
    
    func test5() {
        XCTAssertTrue(isValid("{[]}"))
    }
    
    func test6() {
        XCTAssertFalse(isValid("(("))
    }
    
    func test7() {
        XCTAssertTrue(isValid(""))
    }
    
    func isValid(_ s: String) -> Bool {
        
        guard s.count > 0 else { return true }
        var stack: [Character] = []
        
        for char in s {
            
            switch char {
            case "(":
                stack.append(")")
            case "[":
                stack.append("]")
            case "{":
                stack.append("}")
            default:
                guard stack.popLast() == char else { return false }
            }
        }
        
        return stack.count == 0
    }
    
    func bIsValid(_ s: String) -> Bool {
    
        guard s.count % 2 == 0 else { return false }
        
        let symbols: [Character: Character] = ["(":")", "{":"}", "[":"]"]
        var stack: [Character] = []

        for char in s {
            
            if let symbol = symbols[char] {
                stack.append(symbol)
            }else{
                guard stack.popLast() == char else { return false }
            }
        }

        return stack.count == 0
    }
    
    func cIsValid(_ s: String) -> Bool {
        
        if s.count % 2 != 0 { return false }
        
        let symbols: [Character: Character] = ["(":")", "{":"}", "[":"]"]
        var chars: [Character] = Array(s)
        var stack: [Character] = []
        
        while chars.count != 0 {
            
            let currentChar = chars.removeFirst()
            let symbol = symbols[currentChar]
            
            if let char = chars.first, symbol == char {
                chars.removeFirst()
                continue
            }

            if let symbol = symbol {
                stack.append(symbol)
                if chars.count == 0, stack.count != 0 { return false }
                else { continue }
            }else{
                if currentChar == stack.last {
                    stack.removeLast()
                }
                else{ return false }
            }
        }

        return true
    }
}

Solution.defaultTestSuite.run()


