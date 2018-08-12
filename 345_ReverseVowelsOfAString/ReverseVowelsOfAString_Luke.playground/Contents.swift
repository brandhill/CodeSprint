//: 345. Reverse Vowels of a String
//url: https://leetcode.com/problems/reverse-vowels-of-a-string/description/


import UIKit
import XCTest

class Solution: XCTestCase {

    func reverseVowels(_ s: String) -> String {
        let vowels: [Character] = ["a", "e", "i", "o", "u", "A", "E", "I", "O", "U"]

        var stack:[Character] = []
        var result = ""
        
        for char in s {
            if (vowels.contains(char)) {
                stack.append(char)
            }
        }
        
        for char in s {
            if (vowels.contains(char)) {
                guard let last = stack.popLast() else { return "" }
                result = result + String(last)
            }
            else {
                result = result + String(char)
            }
        }
        return result
    }
    
    func reverseVowelsWithSwap(_ s: String) -> String {
        let vowels: [Character] = ["a", "e", "i", "o", "u", "A", "E", "I", "O", "U"]

        var charArray = Array(s)
        var frontIndex = 0
        var endIndex = charArray.count - 1
        
        while frontIndex < endIndex {
            
            if !(vowels.contains(charArray[frontIndex])) {
                frontIndex = frontIndex + 1
                continue
            }
            
            if !(vowels.contains(charArray[endIndex])) {
                endIndex = endIndex - 1
                continue
            }
            
            if (vowels.contains(charArray[frontIndex]) && vowels.contains(charArray[endIndex])) {
                charArray.swapAt(frontIndex, endIndex)
                frontIndex = frontIndex + 1
                endIndex = endIndex - 1
            }
        }
        
        return String(charArray)
    }
    
    
    
    func testhelloShouldbeholle() {
        let input = "hello"
        let ans = "holle"
        
        let result = reverseVowels(input)
        XCTAssert(result == ans, "The OutPut should be holle")
    }
    
    func testleetcodeShouldbeleotcede() {
        let input = "leetcode"
        let ans = "leotcede"

        let result = reverseVowels(input)
        XCTAssert(result == ans, "The OutPut should be leotcede")
    }
    
    func testApPleShouldbeepPlA() {
        let input = "ApPle"
        let ans = "epPlA"
        let result = reverseVowels(input)
        XCTAssert(result == ans, "The OutPut should be epPlA")
    }
    
    func testSWAPhelloShouldbeholle() {
        let input = "hello"
        let ans = "holle"
        
        let result = reverseVowelsWithSwap(input)
        XCTAssert(result == ans, "The OutPut should be holle")
    }
    
    func testSWAPleetcodeShouldbeleotcede() {
        let input = "leetcode"
        let ans = "leotcede"
        
        let result = reverseVowelsWithSwap(input)
        XCTAssert(result == ans, "The OutPut should be leotcede")
    }
    
    func testSWAPApPleShouldbeepPlA() {
        let input = "ApPle"
        let ans = "epPlA"
        let result = reverseVowelsWithSwap(input)
        XCTAssert(result == ans, "The OutPut should be epPlA")
    }
}

Solution.defaultTestSuite.run()
