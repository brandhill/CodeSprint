//: Playground - noun: a place where people can play

import UIKit
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
    
    let rootNode = TreeNode(1)
    let left2Node = TreeNode(2)
    let right2Node = TreeNode(2)
    let left3Node = TreeNode(3)
    let left4Node = TreeNode(4)
    let right3Node = TreeNode(3)
    let right4Node = TreeNode(4)
    
    func isSymmetric(_ root: TreeNode?) -> Bool {
        guard let root = root else {
            return true
        }
        return isSymmetricTree(root.left, root.right)
    }
    
    func isSymmetricTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        
        guard let left = p, let right = q else {
            if (q == nil) && (p == nil) {
                return true
            }
            else {
                return false
            }
        }
        
        if left.val == right.val {
            return isSymmetricTree(left.left, right.right) && isSymmetricTree(left.right, right.left)
        }
        else {
            return false
        }
    }
    
    func test1223443ShouldbeTrue() {
        
        rootNode.left = left2Node
        rootNode.right = right2Node
        left2Node.left = left3Node
        left2Node.right = left4Node
        right2Node.left = right4Node
        right2Node.right = right3Node
        
        let result = isSymmetric(rootNode)
        XCTAssert(result, "[1,2,2,3,4,4,3] is symmetric")
    }
    
    func test122null3null3ShouldbeFalse() {
        
        rootNode.left = left2Node
        rootNode.right = right2Node
        left2Node.right = left3Node
        right2Node.right = right3Node
        
        let result = isSymmetric(rootNode)
        XCTAssert(!result, "[1,2,2,null,3,null,3] is not symmetric")

    }
}

Solution.defaultTestSuite.run()
