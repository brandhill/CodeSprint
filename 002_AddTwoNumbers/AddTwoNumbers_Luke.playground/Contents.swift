//: https://leetcode.com/problems/add-two-numbers/description/
//: O(n)

import UIKit
import XCTest

public class ListNode {
    public var val: Int
    public var next: ListNode?
    
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}
class Solution: XCTestCase {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if (l1 != nil) && (l2 == nil) {
            return l1
        }
        if (l1 == nil) && (l2 != nil) {
            return l2
        }
        
        var l1Current = l1
        var l2Current = l2
        let firstNode = ListNode(0)
        var resultNode = firstNode
        
        var add = 0
    
        while (l1Current != nil) || (l2Current != nil) || (add != 0) {
            
            if (l1Current != nil) && (l2Current == nil) && (add == 0) {
                resultNode.next = l1Current
                return firstNode.next
            }
            if (l1Current == nil) && (l2Current != nil) && (add == 0) {
                resultNode.next = l2Current
                return firstNode.next
            }
            
            let value = (l1Current?.val ?? 0) + (l2Current?.val ?? 0) + add
            add = value / 10
            resultNode.next = ListNode(value % 10)
            resultNode = resultNode.next!
            l1Current = l1Current?.next
            l2Current = l2Current?.next
        }
        
        return firstNode.next
    }
    
    func toString(head: ListNode?) -> String {
        var result = ""
        var currentNode = head
        
        while currentNode != nil {
            result = result + String(currentNode?.val ?? -1)
            currentNode = currentNode?.next
        }
        return result
    }
    
    func test243Plus564Shouldbe708() {
        let l13node = ListNode(3)
        let l14node = ListNode(4)
        let l12node = ListNode(2)

        let l24node = ListNode(4)
        let l26node = ListNode(6)
        let l25node = ListNode(5)
        
        
        l12node.next = l14node
        l14node.next = l13node
        
        l25node.next = l26node
        l26node.next = l24node

        let assertString = "708"
        
        let result = addTwoNumbers(l12node, l25node)
        let resultString = toString(head: result)
        XCTAssert(resultString == assertString, "Result should be 708")
    }
    
    func test5Plus5Shouldbe01() {
        let l1 = ListNode(5)
        let l2 = ListNode(5)
        
        let assertString = "01"
        
        let result = addTwoNumbers(l1, l2)
        let resultString = toString(head: result)
        XCTAssert(resultString == assertString, "Result should be 01")

    }
}

Solution.defaultTestSuite.run()
