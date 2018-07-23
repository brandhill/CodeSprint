//
//  RepeatedStringMatch_Max.swift
//  LeetCode
//
//  Created by Ｍax.Chen on 2018/7/22.
//  Copyright © 2018年 Ｍax.Chen. All rights reserved.
//
//  https://leetcode.com/problems/repeated-string-match/description/

import Foundation


class Solution {
    func repeatedStringMatch(_ A: String, _ B: String) -> Int {
        var count = B.count / A.count
        count += (B.count > count * A.count ? 1 : 0)
        var temp = String(repeating: A, count: count)
        if temp.range(of: B) != nil {
            return count
        }
        
        temp = String(repeating: A, count: count + 1)
        if temp.range(of: B) != nil {
            return count + 1
        }
        return -1
    }
}
