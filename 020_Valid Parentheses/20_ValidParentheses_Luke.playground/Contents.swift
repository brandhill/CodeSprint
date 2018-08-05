//: Playground - noun: a place where people can play

import UIKit
import XCTest

class Solution: XCTestCase {
    //{} - curly brackets
    //[] - square brackets
    //() - parentheses

    func isValid(_ s: String) -> Bool {
        var stackArr = [Character]()
        
        if (s.isEmpty) {
            return true
        }
        
        for char in s {
            
            if (char == "(") || (char == "{") || (char == "[") {
                stackArr.append(char)
            }
            else {
                guard let lastChar = stackArr.last else {
                    return !stackArr.isEmpty
                }
                
                if (char == ")") && (lastChar == "(") {
                    stackArr.popLast()
                }
                else if (char == "]") && (lastChar == "[") {
                    stackArr.popLast()
                }
                else if (char == "}") && (lastChar == "{") {
                    stackArr.popLast()
                }
            }
        }
        
        return stackArr.isEmpty
    }
    
    func testLR_Parentheses_Should_True() {
        let result = isValid("()")
        XCTAssert(result, "()_Should_True")
    }
    // "()[]{}"
    func testCase2_Should_True() {
        let result = isValid("()[]{}")
        XCTAssert(result, "()[]{}_Should_True")
    }
    //"(]"
    func testCase3_Should_False() {
        let result = isValid("(]")
        XCTAssert(!result, "(]_Should_False")
    }
    //"([)]"
    func testCase4_Should_False() {
        let result = isValid("([)]")
        XCTAssert(!result, "([)]_Should_False")
    }
    //"{[]}"
    func testCase5_Should_True() {
        let result = isValid("{[]}")
        XCTAssert(result, "{[]}_Should_True")
    }
    //“]"
    func testOnlyRight_Should_False() {
        let result = isValid("]")
        XCTAssert(!result, "]_Should_False")
    }
}

Solution.defaultTestSuite.run()
