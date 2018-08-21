//
//  Solution.swift
//  WordBreak
//
//  Created by 07423.louis.chang on 2018/8/20.
//  Copyright © 2018年 Louis Chang. All rights reserved.
//

import UIKit

class Solution {
    
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        var res = Array<Bool>(repeating: false, count: s.count + 1)
        res[0] = true
        
        for i in 0...s.count {
            let substr = s.dropLast(s.count - i)
            
            for j in 0..<i {
                let str = String(substr.dropFirst(j))
                
                if res[j] && wordDict.contains(str) {
                    res[i] = true
                    break
                }
            }
        }
        
        return res[s.count]
    }
    
}
