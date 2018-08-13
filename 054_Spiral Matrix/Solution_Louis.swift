//
//  Solution.swift
//  SpiralMatrix
//
//  Created by 07423.louis.chang on 2018/8/13.
//  Copyright © 2018年 Louis Chang. All rights reserved.
//

import UIKit

class Solution {
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        if matrix.isEmpty {
            return []
        }
        var arr = [Int]()
        var x = matrix[0].count - 1
        var y = matrix.count - 1
        var xp = 0
        var yp = 0
        let totalElementCount = (x+1)*(y+1)
        
        while arr.count != totalElementCount {

            for i in xp...x {
                arr.append(matrix[yp][i])
                print(yp, i)
            }
            yp += 1
            if(arr.count >= totalElementCount) { break }
            print("")
            
            for i in yp...y {
                arr.append(matrix[i][x])
                print(i, x)
            }
            x -= 1
            if(arr.count >= totalElementCount) { break }
            print("")
            
            for i in stride(from: x, to: xp-1, by: -1) {
                print(y, i)
                arr.append(matrix[y][i])
            }
            y -= 1
            if(arr.count >= totalElementCount) { break }
            print("")
            
            for i in stride(from: y, to: yp-1, by: -1) {
                print(i, xp)
                arr.append(matrix[i][xp])
            }
            print("")
            
            xp += 1
            if(arr.count >= totalElementCount) { break }
        }
        
        return arr
    }
}
