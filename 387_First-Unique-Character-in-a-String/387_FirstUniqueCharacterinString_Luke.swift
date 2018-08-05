//
//  FirstUniqueCharacterinString.swift
//  LeeCode
//
//  Created by Hotdog on 2018/7/29.
//  Copyright © 2018年 Hotdog. All rights reserved.
//

import Foundation

class Solution {
    func firstUniqChar_Luke(_ s: String) -> Int {
        
        for (baseIndex, baseChar) in s.enumerated() {
            var isAns:Bool = true
            for (comIndex, comChar) in s.enumerated() {
                if (baseIndex == comIndex) { continue }
                if (baseChar == comChar) {
                    isAns = false
                    break
                }
            }
            if (isAns) {
                return baseIndex
            }
        }
        return -1
    }
    
    func firstUniqChar_Luke2(_ s: String) -> Int {
        var counts: [Character:Int] = [:]
        
        for char in s {
            counts[char] = (counts[char] ?? 0) + 1
        }
        
        if let firstNoRepeartChar = s.filter({counts[$0] == 1}).first {
            return s.index(of: firstNoRepeartChar)?.encodedOffset ?? -1
        }
        else {
            return -1
        }
    }
}
