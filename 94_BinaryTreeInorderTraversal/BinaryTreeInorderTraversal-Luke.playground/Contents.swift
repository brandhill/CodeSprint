//: Playground - noun: a place where people can play

import Foundation
import XCTest


public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

class Solution: XCTestCase {
    
    var result: [Int] = []
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        guard root != nil else {
            return []
        }
        inorderTraversal(root?.left)
        result.append(root!.val)
        inorderTraversal(root?.right)
        return result
    }
    
    func test1null23Return132() {
        let rootTree = TreeNode(1)
        let right2Tree = TreeNode(2)
        let left3Tree = TreeNode(3)
        rootTree.right = right2Tree
        right2Tree.left = left3Tree
        
        let assert = [1,3,2]
        let result = inorderTraversal(rootTree)
        
        XCTAssert(result == assert, "The result should be [1,3,2]")
    }
}

Solution.defaultTestSuite.run()
