//
//  GenerateParentheses_Max.swift
//  
//
//  Created by Max Chen on 2018/7/16.
//
//  https://leetcode.com/problems/generate-parentheses/description/

import Foundation

class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        func helper(_ result: inout [String], _ str: String, _ left: Int, _ right: Int){
            if left + right == 2 * n{
                result.append(str)
                return
            }
            if left < n{
                let s = str + "("
                helper(&result, s, left + 1, right)
                if left > right{
                    let s = str + ")"
                    helper(&result, s, left, right + 1)
                }
            }else{
                let s = str + ")"
                helper(&result, s, left, right + 1)
            }
            
        }
        
        var result = [String]()
        var s = ""
        helper(&result,s,0,0)
        return result
        
    }
}
