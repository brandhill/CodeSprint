import Foundation

class Solution {
    func reverse(_ x: Int) -> Int {
        
        if checkOverflow(x) {
            return 0
        }
        
        let isNegative = x < 0
        let reviseX = isNegative ? -x : x
        let reversed: [Character] = String(reviseX).reversed()
        var text = String(reversed)
        
        if isNegative {
            text = "-" + text
        }
        
        let result = Int(text) ?? 0
        
        if checkOverflow(result) {
          return 0
        }
    
        return result
    }
    
    func checkOverflow(_ x: Int) -> Bool {
        return x > 2147483647 || -2147483648 > x
    }
}

let result = Solution().reverse(1534236469)
print(result)
