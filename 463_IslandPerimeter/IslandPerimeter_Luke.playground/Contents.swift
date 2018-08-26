//: https://leetcode.com/problems/island-perimeter/description/
//: O(n2)

import Foundation
import XCTest

class Solution: XCTestCase {
    
    func islandPerimeter(_ grid: [[Int]]) -> Int {
        
        if grid.count == 0 || grid[0].count == 0 {
            return 0
        }
        
        var perimeter = 0
        let xAxis = grid.count
        let yAxis = grid[0].count
        
        for i in 0..<xAxis {
            for j in 0..<yAxis {
                
                if grid[i][j] == 1 {
                    perimeter = perimeter + 4
                
                    if j+1 < grid[i].count {
                        if grid[i][j+1] == 1 {
                            perimeter = perimeter - 2
                        }
                    }
                    
                    if i+1 < grid.count {
                        if grid[i+1][j] == 1 {
                            perimeter = perimeter - 2
                        }
                    }
                }
            }
        }
        
        return perimeter
    }
    
    func test1() {
        let inputGrid = [[0,1,0,0],
                         [1,1,1,0],
                         [0,1,0,0],
                         [1,1,0,0]]
//        let inputGrid = [[0,1,0,0]]
        
        let assert = 16
        let result = islandPerimeter(inputGrid)
        XCTAssert(result == assert , "Result should be 16")
    }
}

Solution.defaultTestSuite.run()
