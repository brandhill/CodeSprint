//
//  Solution.swift
//  LetterOfPhoneNumber
//
//  Created by 07423.louis.chang on 2018/7/27.
//  Copyright © 2018年 Louis Chang. All rights reserved.
//

import UIKit

class Solution {
    static let numLetters = [
        ["a", "b", "c"], // 2
        ["d", "e", "f"], // 3
        ["g", "h", "i"], // 4
        ["j", "k", "l"], // 5
        ["m", "n", "o"], // 6
        ["p", "q", "r", "s"], // 7
        ["t", "u", "v"], // 8
        ["w", "x", "y", "z"], // 9
    ]
    
    func letterCombinations(_ digits: String) -> [String] {
        guard digits.count != 0 else { return [] }
        var inputs = digits.map{ Solution.numLetters[Int(String($0))! - 2] }
        let initial = inputs.removeFirst()
        return inputs.reduce(initial) { (result, next) -> [String] in
            var tmp:[String] = []
            for x in result {
                for y in next {
                    tmp.append(x+y)
                }
            }
            return tmp
        }
    }
}
