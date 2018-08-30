// 94. Binary Tree Inorder Traversal
// https://leetcode.com/problems/binary-tree-inorder-traversal/

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
    
    func test1() {
        let root = TreeNode(1)
        root.right = TreeNode(2)
        root.right?.left = TreeNode(3)
        let result = inorderTraversal(root)
        XCTAssertTrue(result == [1,3,2])
    }
    
    func test2() {
//        let root1 = TreeNode(1)
//        root1.left = TreeNode(2)
//
//        let root2 = TreeNode(1)
//        root2.right = TreeNode(2)
//
//        let result = isSameTree(root1, root2)
//        XCTAssertFalse(result)
    }
    
    func test3() {
//        let root1 = TreeNode(1)
//        root1.left = TreeNode(2)
//        root1.right = TreeNode(1)
//
//        let root2 = TreeNode(1)
//        root2.left = TreeNode(1)
//        root2.right = TreeNode(2)
//
//        let result = isSameTree(root1, root2)
//        XCTAssertFalse(result)
    }
    
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var result: [Int] = []
        inorderRecursion(root, result: &result)
        return result
    }
    
    func inorderRecursion(_ current: TreeNode?, result: inout [Int]) {
        guard let current = current else { return }
        inorderRecursion(current.left, result: &result)
        result.append(current.val)
        inorderRecursion(current.right, result: &result)
    }
    
    func inorderTraversal2(_ root: TreeNode?) -> [Int] {

        var current = root
        var stack: [TreeNode] = []
        var result: [Int] = []
        
        while current != nil || !stack.isEmpty {
            
            while let unwrapCurrent = current {
                stack.append(unwrapCurrent)
                current = current?.left
            }
            
            let pop = stack.removeLast()
            result.append(pop.val)
            current = pop.right
        }

        return result
    }
}

Solution.defaultTestSuite.run()
