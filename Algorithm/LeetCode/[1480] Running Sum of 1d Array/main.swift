//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 9/30/24.
//

class Solution {
    func runningSum(_ nums: [Int]) -> [Int] {
        var prefixSum = [nums[0]]
        
        for i in 1..<nums.count {
            prefixSum.append(prefixSum[i-1] + nums[i])
        }
        
        return prefixSum
    }
}
