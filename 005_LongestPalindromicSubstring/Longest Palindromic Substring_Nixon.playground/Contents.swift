// 5. Longest Palindromic Substring
// https://leetcode.com/problems/longest-palindromic-substring/

import Foundation
import XCTest

class Solution: XCTestCase {
    
    func test1() {
        
        let input = "babad"
        let output = longestPalindrome(input)
        XCTAssertTrue(output == "bab")
    }
    
    func test2() {

        let input = "cbbd"
        let output = longestPalindrome(input)
        XCTAssertTrue(output == "bb")
    }

    func test3() {

        let input = "a"
        let output = longestPalindrome(input)
        XCTAssertTrue(output == "a")
    }

    func test4() {

        let input = "ac"
        let output = longestPalindrome(input)
        XCTAssertTrue(output == "a")
    }

    func test5() {

        let input = ""
        let output = longestPalindrome(input)
        XCTAssertTrue(output == "")
    }

    func test6() {

        let input = "babadada"
        let output = longestPalindrome(input)
        XCTAssertTrue(output == "adada")
    }

    func test7() {

        let input = "aaabaaaa"
        let output = longestPalindrome(input)
        XCTAssertTrue(output == "aaabaaa")
    }

    func test8() {

        let input = "aacdefcaa"
        let output = longestPalindrome(input)
        XCTAssertTrue(output == "aa")
    }
    /*
    func test9() {

        let input = "civilwartestingwhetherthatnaptionoranynartionsoconceivedandsodedicatedcanlongendureWeareqmetonagreatbattlefiemldoftzhatwarWehavecometodedicpateaportionofthatfieldasafinalrestingplaceforthosewhoheregavetheirlivesthatthatnationmightliveItisaltogetherfangandproperthatweshoulddothisButinalargersensewecannotdedicatewecannotconsecratewecannothallowthisgroundThebravelmenlivinganddeadwhostruggledherehaveconsecrateditfaraboveourpoorponwertoaddordetractTgheworldadswfilllittlenotlenorlongrememberwhatwesayherebutitcanneverforgetwhattheydidhereItisforusthelivingrathertobededicatedheretotheulnfinishedworkwhichtheywhofoughtherehavethusfarsonoblyadvancedItisratherforustobeherededicatedtothegreattdafskremainingbeforeusthatfromthesehonoreddeadwetakeincreaseddevotiontothatcauseforwhichtheygavethelastpfullmeasureofdevotionthatweherehighlyresolvethatthesedeadshallnothavediedinvainthatthisnationunsderGodshallhaveanewbirthoffreedomandthatgovernmentofthepeoplebythepeopleforthepeopleshallnotperishfromtheearth"
        let output = longestPalindrome(input)
        XCTAssertTrue(output == "ranynar")
    }

    func test10() {

        let input = "abababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababa"
        let output = longestPalindrome(input)
        XCTAssertTrue(output == "abababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababababa")
    }
 */
    
    func longestPalindrome(_ s: String) -> String {
        guard s.count > 0 else { return "" }
        var start = 0, end = 0
        for i in 0..<s.count {
            let len1 = lengthOfExpandAroundCenter(s, left: i, right: i)
            let len2 = lengthOfExpandAroundCenter(s, left: i, right: i + 1)
            let len = max(len1, len2)
            if len > (end - start + 1) {
                start = i - (len - 1) / 2
                end = i + len / 2
            }
        }
        
        let subString = s[String.Index(encodedOffset: start)...String.Index(encodedOffset: end)]
        return String(subString)
    }
    
    func lengthOfExpandAroundCenter(_ s: String, left: Int, right: Int) -> Int {
     
        let chars = Array(s)
        var left = left
        var right = right
        while left >= 0 && right < chars.count && chars[left] == chars[right] {
            left -= 1
            right += 1
        }
        return right - left - 1
    }
    
    func cLongestPalindrome(_ s: String) -> String {
        
        guard s.count != 0 else { return s }
        var chars: [Character] = Array(s)
        var reverseChars: [Character] = chars.reversed()
        let len = chars.count
        var resultArr: [Int] = Array<Int>(repeating: 0, count: len)
        var maxLen = 0
        var end = 0
        
        for i in 0..<len {
            for j in (0..<len).reversed() {
                guard chars[i] == reverseChars[j] else {
                    resultArr[j] = 0
                    continue
                }
                if j != 0 {
                    resultArr[j] = 1 + resultArr[j - 1]
                }else{
                    resultArr[j] = 1
                }
                let subLen = resultArr[j]
                guard maxLen < subLen else { continue }
                let beforeRevStart = len - j - 1
                let beforeRevEnd = beforeRevStart + subLen - 1
                guard i == beforeRevEnd else { continue }
                maxLen = subLen
                end = i
            }
        }
        return String(chars[(end - maxLen + 1)...end])
    }
    
    func bLongestPalindrome(_ s: String) -> String {
        
        guard s.count != 0 else { return s }
        var chars: [Character] = Array(s)
        var reverseChars: [Character] = chars.reversed()
        let len = chars.count
        var resultArr: [[Int]] = Array<Array<Int>>(repeating: Array<Int>(repeating: 0, count: len), count: len)
        var maxLen = 0
        var end = 0
        
        for i in 0..<len {
            for j in 0..<len {
                if chars[i] == reverseChars[j] {
                    if i == 0 || j == 0 {
                        resultArr[i][j] = 1
                    }else{
                        resultArr[i][j] = 1 + resultArr[i - 1][j - 1]
                    }
                    
                    let subLen = resultArr[i][j]
                    if maxLen < subLen {
                        
                        let beforeRevStart = len - j - 1
                        let beforeRevEnd = beforeRevStart + subLen - 1
                        
                        if beforeRevEnd == i {
                            maxLen = subLen
                            end = beforeRevEnd
                        }
                    }
                }
            }
        }
        return String(chars[(end - maxLen + 1)...end])
    }
}

Solution.defaultTestSuite.run()


