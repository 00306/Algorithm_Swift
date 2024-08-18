//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 9/5/24.
//

class Solution {
    func isUgly(_ n: Int) -> Bool {
        var number = n
        if number == 0 { return false }
        
        let factors = [2, 3, 5]
        
        for factor in factors {
            while number % factor == 0 {
                number /= factor
            }
        }
        
        return number == 1
    }
}
