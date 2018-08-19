// 2. Add Two Numbers
// https://leetcode.com/problems/add-two-numbers/

import Foundation
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
    
    func test1() {
        
        let root1 = ListNode(2)
        root1.next = ListNode(4)
        root1.next?.next = ListNode(3)
        
        let root2 = ListNode(5)
        root2.next = ListNode(6)
        root2.next?.next = ListNode(4)
        
        var current = addTwoNumbers(root1, root2)
        var result = ""
        while current != nil {
            result += String(current?.val ?? 0)
            current = current?.next
        }
        XCTAssertTrue(result == "708")
    }
    
    func test2() {
        
        let root1 = ListNode(5)
        let root2 = ListNode(5)
        
        var current = addTwoNumbers(root1, root2)
        var result = ""
        while current != nil {
            result += String(current?.val ?? 0)
            current = current?.next
        }
        XCTAssertTrue(result == "01")
    }
    
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        
        var currentL1 = l1
        var currentL2 = l2
        var resultRoot: ListNode? = nil
        var resultCurrent: ListNode? = nil
        var needRoundOff: Bool = false
        
        while currentL1 != nil || currentL2 != nil {

            var value = (currentL1?.val ?? 0) + (currentL2?.val ?? 0) + Int(truncating: NSNumber(value: needRoundOff))
            
            needRoundOff = value >= 10
            value %= 10

            let node = ListNode(value)
            
            if resultRoot == nil {
                resultRoot = node
                resultCurrent = resultRoot
            }else{
                resultCurrent?.next = node
                resultCurrent = node
            }
            
            currentL1 = currentL1?.next
            currentL2 = currentL2?.next
        }
        
        if needRoundOff {
            resultCurrent?.next = ListNode(1)
        }
        
        return resultRoot
    }
}

Solution.defaultTestSuite.run()
