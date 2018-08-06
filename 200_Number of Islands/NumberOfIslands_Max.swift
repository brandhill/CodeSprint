//
//  NumberOfIslands_Max.swift
//  LeetCode
//
//  Created by Ｍax.Chen on 2018/8/6.
//  Copyright © 2018年 Ｍax.Chen. All rights reserved.
//

import Foundation

class Solution {
    func numIslands(_ grid: [[Character]]) -> Int {
        guard grid.count > 0 && grid[0].count > 0 else {
            return 0
        }
        
        var grid = grid
        let m = grid.count
        let n = grid[0].count
        var count = 0
        
        for i in 0..<m {
            for j in 0..<n {
                if String(grid[i][j]) == "1" {
                    count += 1
                    dfs(&grid, m, n, i, j)
                }
            }
        }
        
        return count
    }
    
    private func dfs(_ grid: inout[[Character]], _ m: Int, _ n: Int, _ i: Int, _ j: Int) {
        guard i >= 0 && i < m && j >= 0 && j < n && String(grid[i][j]) == "1" else {
            return
        }
        
        grid[i][j] = Character("0")
        
        dfs(&grid, m, n, i + 1, j)
        dfs(&grid, m, n, i - 1, j)
        dfs(&grid, m, n, i, j + 1)
        dfs(&grid, m, n, i, j - 1)
    }
}
