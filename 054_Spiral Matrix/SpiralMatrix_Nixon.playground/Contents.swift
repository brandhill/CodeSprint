// 54. Spiral Matrix
// https://leetcode.com/problems/spiral-matrix/

import Foundation
import XCTest

class Solution: XCTestCase {
    
    func test1() {
        
        let input: [[Int]] = []
        let output = spiralOrder(input)
        XCTAssertTrue(output == [])
    }
    
    func test2() {
        
        let input: [[Int]] = [
            [ 1, 2, 3 ],
            [ 4, 5, 6 ],
            [ 7, 8, 9 ]
        ]
        let output = spiralOrder(input)
        XCTAssertTrue(output == [1,2,3,6,9,8,7,4,5])
    }
    
    func test3() {
        
        let input: [[Int]] = [
            [1, 2, 3, 4],
            [5, 6, 7, 8],
            [9,10,11,12]
        ]
        let output = spiralOrder(input)
        XCTAssertTrue(output == [1,2,3,4,8,12,11,10,9,5,6,7])
    }
    
    func test4() {
        
        let input: [[Int]] = [[7],[9],[6]]
        let output = spiralOrder(input)
        XCTAssertTrue(output == [7,9,6])
    }
    
    func spiralOrder(_ matrix: [[Int]]) -> [Int] {
        
        guard matrix.count > 0 else { return [] }
        
        var res: [Int] = []
        var yMin = 0
        var xMin = 0
        var xMax = matrix[0].count - 1
        var yMax = matrix.count - 1

        while xMax >= xMin && yMax >= yMin {
            
            if xMax == xMin && yMax == yMin {
                let value = matrix[xMax][yMax]
                res.append(value)
                break
            }
            if yMax == yMin {
                for i in xMin...xMax {
                    let value = matrix[yMin][i]
                    res.append(value)
                }
                break
            }
            if xMax == xMin {
                for i in yMin...yMax {
                    let value = matrix[i][xMin]
                    res.append(value)
                }
                break
            }
            for i in xMin..<xMax {
                let value = matrix[yMin][i]
                res.append(value)
            }
            for i in yMin..<yMax {
                let value = matrix[i][xMax]
                res.append(value)
            }
            for i in ((xMin + 1)...xMax).reversed() {
                let value = matrix[yMax][i]
                res.append(value)
            }
            for i in ((yMin + 1)...yMax).reversed() {
                let value = matrix[i][xMin]
                res.append(value)
            }
            
            xMin += 1
            xMax -= 1
            yMin += 1
            yMax -= 1
        }
        
        return res
    }
}

Solution.defaultTestSuite.run()


