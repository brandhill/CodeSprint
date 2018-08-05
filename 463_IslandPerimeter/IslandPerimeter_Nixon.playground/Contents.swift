// 463. Island Perimeter
// https://leetcode.com/problems/island-perimeter/

import Foundation
import XCTest

class Solution: XCTestCase {
    
    func test1() {
        let grid = [[0,1,0,0],
                    [1,1,1,0],
                    [0,1,0,0],
                    [1,1,0,0]]
        let ans = islandPerimeter(grid) == 16
        XCTAssertTrue(ans)
    }
    
    func islandPerimeter(_ grid: [[Int]]) -> Int {
        
        var result = 0
        
        for i in 0...(grid.count - 1) {
            for j in 0...(grid[i].count - 1) {
                let e = grid[i][j]
                guard e == 1 else { continue }
                result += 4
                if j != grid[i].count - 1 {
                    if grid[i][j + 1] == 1 {
                        result -= 2
                    }
                }
                if i != grid.count - 1 {
                    if grid[i + 1][j] == 1 {
                        result -= 2
                    }
                }
            }
        }
        
        return result
    }
}

Solution.defaultTestSuite.run()
