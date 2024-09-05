//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 10/2/24.
//

class Solution {
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        var cumulativeSum = 0
        var sumCount: [Int: Int] = [0: 1]
        var result = 0
        
        for num in nums {
            cumulativeSum += num
            
            if let count = sumCount[cumulativeSum - k] {
                result += count
            }
            
            sumCount[cumulativeSum, default: 0] = sumCount[cumulativeSum, default: 0] + 1
        }
        
        return result
    }
}
