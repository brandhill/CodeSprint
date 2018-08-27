//: Playground - noun: a place where people can play
// https://leetcode.com/problems/find-anagram-mappings

import Foundation
import XCTest

class Solution: XCTestCase  {
    
    func test1() {
        let result = anagramMappings([12, 28, 46, 32, 50], [50, 12, 32, 46, 28])
        XCTAssertTrue(result == [1, 4, 3, 2, 0])
        
    }
    
    func test2() {
        let result = anagramMappingsTwo([12, 28, 46, 32, 50], [50, 12, 32, 46, 28])
        XCTAssertTrue(result == [1, 4, 3, 2, 0])
        
    }
    
    func anagramMappings(_ A: [Int], _ B: [Int]) -> [Int] {
        
        var result = [Int]()
        var num = A.count
        
        for i in 0..<num {
            for j in 0..<num {
                if A[i] == B[j] {
                    result.append(j)
                    break
                }
            }
        }
        return result;
    }
    
    
    
    func anagramMappingsTwo(_ A: [Int], _ B: [Int]) -> [Int] {
        
        var result = [Int]()
        var num = A.count
        var dic = [Int: Int]()
        
        for i in 0..<num {
            dic[B[i]] = i
        }
        for i in 0..<num {
            result.append(dic[A[i]]!)
        }
        
        return result;
    }
    
    
}

Solution.defaultTestSuite.run()
