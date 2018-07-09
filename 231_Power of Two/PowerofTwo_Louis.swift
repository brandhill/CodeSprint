//
//  Solution.swift
//  PowerOfTwo
//
//  Created by 07423.louis.chang on 2018/6/29.
//  Copyright © 2018年 Louis Chang. All rights reserved.
//

import UIKit

class Solution {
    func isPowerOfTwo(_ n: Int) -> Bool {
        if (n == 0) {
            return false
        }
        if (n == 1) {
            return true
        }
        let quotient = n / 2
        let remainder = n % 2
        if(remainder == 0) {
            return isPowerOfTwo(quotient)
        }
        return false
    }
    
    func isPowerOfTwoBinary(_ n: Int) -> Bool {
        return String(n, radix: 2).filter{ $0 == "1" } == "1"
    }
}
