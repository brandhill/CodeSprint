//
//  FindAnagramMappings_Max.swift
//  LeetCode
//
//  Created by Ｍax.Chen on 2018/7/13.
//  Copyright © 2018年 Ｍax.Chen. All rights reserved.
//

import Foundation


let arrayOne = [12, 28, 46, 32, 50]
let arrayTwo = [50, 12, 32, 46, 28]

func findMapping(a:[Int], b:[Int]) -> [Int] {
    var result = [Int]()
    
    for i in 0..<a.count {
        for j in 0..<b.count {
            if a[i] == b[j] {
                result.append(j)
            }
        }
    }
    
    return result
}

