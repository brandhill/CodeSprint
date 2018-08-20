// 3. Longest Substring Without Repeating Characters
// https://leetcode.com/problems/longest-substring-without-repeating-characters/

import Foundation
import XCTest

class Solution: XCTestCase {
    
    func test1() {
        
        let result = lengthOfLongestSubstring("abcabcbb")
        XCTAssertTrue(result == 3)
    }
    
    func test2() {
        
        let result = lengthOfLongestSubstring("bbbbb")
        XCTAssertTrue(result == 1)
    }
    
    func test3() {
        
        let result = lengthOfLongestSubstring("pwwkew")
        XCTAssertTrue(result == 3)
    }
    
    func test4() {
        let result = lengthOfLongestSubstring(" ")
        XCTAssertTrue(result == 1)
    }
    
    func test5() {
        let result = lengthOfLongestSubstring("aab")
        XCTAssertTrue(result == 2)
    }
    
    func lengthOfLongestSubstring(_ s: String) -> Int {
        
        guard s.count > 0 else { return 0 }
        
        var indexMap: [Character: Int] = [:]
        var result = 0
        var startIndex = 0
        let s = Array(s)
        
        for i in 0..<(s.count) {
            
            let c = s[i]
            if let j = indexMap[c], startIndex <= j {
                startIndex = j + 1
            }
            
            indexMap[c] = i
            
            let count = i - startIndex + 1
            if result < count {
                result = count
            }
        }
        
        return result
    }
    
    func aLengthOfLongestSubstring(_ s: String) -> Int {
        
        guard s.count > 0 else { return 0 }
        
        var chars: [Character] = []
        var result = 0
        
        for c in s {
            
            if let i = chars.index(of: c) {
                if result < chars.count {
                    result = chars.count
                }
                var tmp: [Character] = []
                var j = i + 1
                while j < chars.count {
                    tmp.append(chars[j])
                    j += 1
                }
                chars = tmp
            }
            chars.append(c)
        }
        
        if result < chars.count {
            result = chars.count
        }
        
        return result
    }
}

Solution.defaultTestSuite.run()
