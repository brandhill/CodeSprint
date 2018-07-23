
import UIKit

struct Element {
    let value: Int
    let index: Int
}

class Solution {
    
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        
        var dic: [Int: Int] = [:]

        for i in 0..<nums.count {
            let num = nums[i]
            let complement = target - num
            guard let j = dic[complement] else {
                dic[num] = i
                continue
            }
            return [i, j]
        }
        
        return [-1, -1]
    }

    
    func aTwoSum(_ nums: [Int], _ target: Int) -> [Int] {
        
        var result: [Int]?
        var dic: [Int: Int] = [:]
        
        for i in 0..<nums.count {
            dic[nums[i]] = i
        }

        for i in 0..<nums.count {
            let num = nums[i]
            let difference = target - num
            guard let j = dic[difference], i != j else {
                continue
            }
            result = [i, j]
            break
        }
        
        return result ?? [0, 0];
    }

    
    func bTwoSum(_ nums: [Int], _ target: Int) -> [Int] {
        
        let elements = nums.enumerated().map{ Element(value: $1, index: $0) }.sorted { $0.value < $1.value }
        var startIndex = 0;
        var endIndex = nums.count - 1;
        var result: [Int]?
        
        while startIndex < endIndex {
            let sum = elements[startIndex].value + elements[endIndex].value
            if sum == target {
                result = [
                    min(elements[startIndex].index, elements[endIndex].index),
                    max(elements[startIndex].index, elements[endIndex].index)
                ]
                break
            }
            else if sum < target {
                startIndex += 1;
            }
            else {
                endIndex -= 1;
            }
        }
        
        return result ?? [-1, -1];
    }
}

let input = [3,2,4]
Solution().twoSum(input, 6);
