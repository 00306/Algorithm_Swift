//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 9/30/24.
//

class Solution {
    func pivotIndex(_ nums: [Int]) -> Int {
        var left = 0
        var right = nums.reduce(0, +)
        
        for i in 0..<nums.count {
            right -= nums[i]
            if left == right { return i }
            left += nums[i]
        }
        
        return -1
    }
}
