//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 10/2/24.
//

class Solution {
    func selfDividingNumbers(_ left: Int, _ right: Int) -> [Int] {
        var result: [Int] = []
        
        for i in left...right {
            var num = i
            var isSelfDivided = true
            
            while num > 0 {
                let digit = num % 10
                if digit == 0 || i % digit != 0 {
                    isSelfDivided = false
                    break
                }
                
                num /= 10
            }
            
            if isSelfDivided { result.append(i) }
        }
        
        return result
    }
}
