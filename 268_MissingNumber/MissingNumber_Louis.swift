//
//  Solution.swift
//  MissingNumber
//
//  Created by 07423.louis.chang on 2018/7/6.
//  Copyright © 2018年 Louis Chang. All rights reserved.
//

import UIKit

class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        return (1 + nums.count) * nums.count / 2 - nums.reduce(0, +)
    }
    
    func missingNumberXOR(_ nums: [Int]) -> Int {
        var index = -1
        let missingNumber = nums.reduce(nums.count) { (result, next) -> Int in
            index += 1
            return result ^ (index ^ next)
        }
        return missingNumber
    }
}
