//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 9/12/24.
//

class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var ones = 0
        var twos = 0
        
        for num in nums {
            ones = (ones ^ num) & ~twos
            twos = (twos ^ num) & ~ones
        }
        
        return ones
    }
}
