//
//  MergeTwoSortedLists_Max.swift
//  LeetCode
//
//  Created by Ｍax.Chen on 2018/7/30.
//  Copyright © 2018年 Ｍax.Chen. All rights reserved.
//
//  https://leetcode.com/problems/merge-two-sorted-lists/description/

import Foundation

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}


class Solution {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard let l1 = l1 else { return l2 }
        guard let l2 = l2 else { return l1 }
        if l1.val < l2.val {
            l1.next = mergeTwoLists(l1.next, l2)
            return l1
        } else {
            l2.next = mergeTwoLists(l1, l2.next)
            return l2
        }
    }
}
