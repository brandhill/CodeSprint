//
//  Solution.swift
//  PowXN
//
//  Created by 07423.louis.chang on 2018/8/2.
//  Copyright © 2018年 Louis Chang. All rights reserved.
//

import UIKit

func *(lhs:Decimal, rhs:Double) -> Double {
    let result = lhs * Decimal(rhs)
    return Double(NSDecimalNumber(decimal: result).stringValue )!
}

class Solution {

    func myPow(_ x: Double, _ n: Int) -> Double {
        guard n != 0 else {return 1.0}
        
        var _x:Decimal = Decimal(x)
        var xx:Decimal = 0
        
        var _n:Int = n
        if n<0 {
            _x = 1 / _x
            _n = abs(n)
        }
        
        var total:[Decimal] = []
        let bn = String(_n, radix: 2).reversed()
        var j = 1
        for i in bn {
            if j == 1 {
                xx = _x
            }
            else {
                xx = xx * xx
            }
            j = j + 1
            print(i)
            if Int(String(i)) == 1 {
                total.append(xx)
            }
        }
        
        let result = NSDecimalNumber(decimal: total.reduce(1, *)).doubleValue
        if result.isNaN {
            return 0.0
        }
        else {
            return result
        }
    }
    
    func myPow3(_ x: Double, _ n: Int) -> Double {
        return pow(x, Double(n))
    }
    
    func myPow2(_ x: Double, _ n: Int) -> Double {
        guard n != 0 else {return 1.0}
//        let isNegative = n < 0
//        var dec = Decimal(x)
        
        var _x:Decimal = Decimal(x)
        var _n:Int = n
        if n<0 {
            _x = 1 / _x
            _n = abs(n)
        }
        
        let mutiple = _x * _x
        let result = Double(NSDecimalNumber(decimal: mutiple).stringValue )!
        if result.isNaN {
            return 0.0
        }
        if _n % 2 == 0 {
            return myPow(result,_n/2)
        }
        return _x * myPow(result,_n/2)
        
//        for _ in 1..<abs(n) {
//            dec = dec * Decimal(x)
//        }
//        if isNegative {
//            dec = 1 / dec
//        }
//        return NSDecimalNumber(decimal: dec).doubleValue
    }
}
