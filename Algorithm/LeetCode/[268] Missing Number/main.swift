//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 9/10/24.
//

class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        var number = nums.count
        
        for i in 0..<nums.count {
            number = number^i^nums[i]
        }
        
        return number
    }
}
