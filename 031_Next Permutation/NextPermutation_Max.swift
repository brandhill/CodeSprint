//
//  NextPermutation_Max.swift
//  LeetCode
//
//  Created by Ｍax.Chen on 2018/7/26.
//  Copyright © 2018年 Ｍax.Chen. All rights reserved.
//

import Foundation

class Solution {
    func nextPermutation(_ nums: inout [Int]) {
        var n = nums.count
        var i = n - 1
        
        while i > 0 && nums[i] <= nums[i-1] {
            i -= 1
        }
        if i != 0 {
            var p = i
            while p < n && nums[p] > nums[i-1] {
                p += 1
            }
            swap(&nums, i-1, p-1)
        }
        var j = n - 1
        while j > i {
            swap(&nums, i, j)
            i += 1
            j -= 1
        }
        
    }
}
