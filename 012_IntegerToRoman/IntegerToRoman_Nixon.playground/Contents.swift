//: Playground - noun: a place where people can play

import Foundation

class Solution {
    
    func intToRoman(_ num: Int) -> String {
        
        var result = ""
        var num = num
        var i = 0
        
        let symbols: [(String, Int)] = [
            ("M", 1000),
            ("CM", 900),
            ("D", 500),
            ("CD", 400),
            ("C", 100),
            ("XC", 90),
            ("L", 50),
            ("XL", 40),
            ("X", 10),
            ("IX", 9),
            ("V", 5),
            ("IV", 4),
            ("I", 1)
        ]
        
        while num > 0 {
            while num >= symbols[i].1 {
                num -= symbols[i].1
                result += symbols[i].0
            }
            i += 1
        }
        
        return result
    }
    
    
    func bTntToRoman(_ num: Int) -> String {
        
        var result = ""
        var temp = num
        var count = 0
        
        var nineStr = ""
        var fiveStr = ""
        var fourStr = ""
        var oneStr = ""
        
        
        while temp != 0 {
            
            let cache = result
            result = ""
            var pop = temp % 10
            temp /= 10
            
            switch count {
            case 0:
                nineStr = "IX"
                fiveStr = "V"
                fourStr = "IV"
                oneStr = "I"
            case 1:
                nineStr = "XC"
                fiveStr = "L"
                fourStr = "XL"
                oneStr = "X"
            case 2:
                nineStr = "CM"
                fiveStr = "D"
                fourStr = "CD"
                oneStr = "C"
            case 3:
                nineStr = ""
                fiveStr = ""
                fourStr = ""
                oneStr = "M"
            default:
                break
            }
            
            if pop == 9 {
                pop -= 9
                result += nineStr
            }
            else if pop >= 5 {
                pop -= 5
                result += fiveStr
            }
            else if pop == 4 {
                pop -= 4
                result += fourStr
            }
            
            while pop != 0 {
                pop -= 1
                result += oneStr
            }
            
            result += cache
            count += 1
        }
        
        return result
    }
}

var r = Solution().intToRoman(3)
print(r)

r = Solution().intToRoman(4)
print(r)

r = Solution().intToRoman(9)
print(r)

r = Solution().intToRoman(58)
print(r)

r = Solution().intToRoman(1994)
print(r)
