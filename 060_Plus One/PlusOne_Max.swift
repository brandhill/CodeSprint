//
//  PlusOne_Max.swift
//  LeetCode
//
//  Created by Ｍax.Chen on 2018/7/2.
//  Copyright © 2018年 Ｍax.Chen. All rights reserved.
//
//  https://leetcode.com/problems/plus-one/description/

import Foundation

class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        var digits = digits
        var index = digits.count - 1
        
        while index >= 0 {
            if digits[index] < 9 {
                digits[index] += 1
                return digits
            }
            
            digits[index] = 0
            index -= 1
        }
        
        digits.insert(1, at: 0)
        return digits
    }
}
