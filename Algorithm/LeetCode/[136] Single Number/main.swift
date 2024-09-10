//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 9/10/24.
//

class Solution {
    func singleNumber(_ nums: [Int]) -> Int {
        var singleNumber = 0
        
        for num in nums {
            singleNumber = singleNumber^num
        }
        
        return singleNumber
    }
}
