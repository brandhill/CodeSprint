// 100. Same Tree
// https://leetcode.com/problems/same-tree/

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
        let root1 = TreeNode(1)
        root1.left = TreeNode(2)
        root1.right = TreeNode(3)
        
        let root2 = TreeNode(1)
        root2.left = TreeNode(2)
        root2.right = TreeNode(3)
        
        let result = isSameTree(root1, root2)
        XCTAssertTrue(result)
    }
    
    func test2() {
        let root1 = TreeNode(1)
        root1.left = TreeNode(2)
        
        let root2 = TreeNode(1)
        root2.right = TreeNode(2)
        
        let result = isSameTree(root1, root2)
        XCTAssertFalse(result)
    }
    
    func test3() {
        let root1 = TreeNode(1)
        root1.left = TreeNode(2)
        root1.right = TreeNode(1)
        
        let root2 = TreeNode(1)
        root2.left = TreeNode(1)
        root2.right = TreeNode(2)
        
        let result = isSameTree(root1, root2)
        XCTAssertFalse(result)
    }
    
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        
        if (p == nil && q != nil) || (p != nil && q == nil) {
            return false
        }

        guard let p = p, let q = q else { return true }
        guard isSameTree(p.right, q.right) else { return false }
        guard isSameTree(p.left, q.left) else { return false }
        
        return p.val == q.val
    }
}

Solution.defaultTestSuite.run()
