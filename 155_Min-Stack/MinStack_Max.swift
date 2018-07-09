//
//  MinStack_Max.swift
//  LeetCode
//
//  Created by Ｍax.Chen on 2018/7/9.
//  Copyright © 2018年 Ｍax.Chen. All rights reserved.
//
//  https://leetcode.com/problems/min-stack/description/

import Foundation

class Node {
    var value: Int?
    var min: Int?
    var next: Node?
    
    init(_ value: Int) {
        self.value = value
    }
}


class MinStack {
    
    var topNode: Node?
    
    func push(_ x: Int) {
        if topNode == nil {
            topNode = Node(x)
            topNode?.min = x
        }else {
            let temp = Node(x)
            temp.next = topNode
            topNode = temp
            topNode?.min = min((topNode?.next?.min)!, x)
        }
    }
    
    func pop() {
        topNode = topNode?.next
    }
    
    func top() -> Int {
        return topNode == nil ? 0 : (topNode?.value)!
    }
    
    func getMin() -> Int {
        return topNode == nil ? 0 : (topNode?.min)!
    }
    
}
