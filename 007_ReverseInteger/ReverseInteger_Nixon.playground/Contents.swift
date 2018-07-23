import Foundation

class Solution {
    func reverse(_ x: Int) -> Int {
        
        if checkOverflow(x) {
            return 0
        }
        
        var temp = x
        var result = 0
        
        while temp != 0 {
            let pop = temp % 10
            temp /= 10
            result = result * 10 + pop
            
            if checkOverflow(result) {
                return 0
            }
        }
        
        return result
    }
    
    func checkOverflow(_ x: Int) -> Bool {
        return x > 2147483647 || -2147483648 > x
    }
}

let result = Solution().reverse(1534236469)
print(result)
