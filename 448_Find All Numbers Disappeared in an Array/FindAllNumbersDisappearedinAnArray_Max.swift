//
//  FindAllNumbersDisappearedinAnArray_Max.swift
//  LeetCode
//
//  Created by Ｍax.Chen on 2018/7/9.
//  Copyright © 2018年 Ｍax.Chen. All rights reserved.
//
//    https://leetcode.com/problems/find-all-numbers-disappeared-in-an-array/description/

import Foundation

class Solution {
    func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
        var nums = nums
        var result = [Int]()
        
        for i in 0..<nums.count {
            let value = abs(nums[i]) - 1
            if nums[value] > 0 {
                nums[value] = -nums[value]
            }
        }
        
        for i in 0..<nums.count {
            if nums[i] > 0 {
                result.append(i + 1)
            }
        }
        return result
    }
    
    
    func findDisappearedNumbers2(_ nums: [Int]) -> [Int] {
        var current = [Bool](repeating: false, count: nums.count + 1)
        for i in 0 ..< nums.count {
            current[nums[i]] = true
        }
        
        var missing = [Int]()
        for i in 1 ..< current.count {
            if current[i] == false {
                missing.append(i)
            }
        }
        return missing
    }
}

//Input:
//[4,3,2,7,8,2,3,1]
//
//Output:
//[5,6]
