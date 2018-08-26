//: https://leetcode.com/problems/same-tree/description/

import Foundation
import XCTest

//Definition for a binary tree node.
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
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        
        guard let left = p, let right = q else {
            if (q == nil) && (p == nil) {
                return true
            }
            else {
                return false
            }
        }
        
        if left.val == right.val {
            return isSameTree(left.left, right.left) && isSameTree(left.right, right.right)
        }
        else {
            return false
        }
    }
    
    func test123with123ShouldbeTrue() {
        let leftRootNode = TreeNode(1)
        let leftTwoNode = TreeNode(2)
        let leftTreeNode = TreeNode(3)
        
        leftRootNode.left = leftTwoNode
        leftRootNode.right = leftTreeNode
        
        let rightRootNode = TreeNode(1)
        let rightTwoNode = TreeNode(2)
        let rightTreeNode = TreeNode(3)
        
        rightRootNode.left = rightTwoNode
        rightRootNode.right = rightTreeNode
        
        let result = isSameTree(leftRootNode, rightRootNode)
        XCTAssert(result, "Result should be true")
    }
    
    func test12with12ShouldbeFalse() {
        let leftRootNode = TreeNode(1)
        let leftTwoNode = TreeNode(2)
        leftRootNode.left = leftTwoNode
        
        let rightRootNode = TreeNode(1)
        let rightTwoNode = TreeNode(2)
        rightRootNode.right = rightTwoNode
        
        let result = isSameTree(leftRootNode, rightRootNode)
        XCTAssert(!result, "Result should be false")
    }
    
    func test121with112ShouldbeFalse() {
        let leftRootNode = TreeNode(1)
        let leftTwoNode = TreeNode(2)
        let leftOneNode = TreeNode(1)
        leftRootNode.left = leftTwoNode
        leftRootNode.right = leftOneNode
        
        let rightRootNode = TreeNode(1)
        let rifhtOneNode = TreeNode(1)
        let rightTwoNode = TreeNode(2)
        rightRootNode.left = rifhtOneNode
        rightRootNode.right = rightTwoNode
        
        let result = isSameTree(leftRootNode, rightRootNode)
        XCTAssert(!result, "Result should be false")
    }
}

Solution.defaultTestSuite.run()
