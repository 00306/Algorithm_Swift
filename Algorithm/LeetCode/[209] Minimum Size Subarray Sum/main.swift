//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 9/25/24.
//

class Solution {
    func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
        var answer = Int.max
        var sum = 0
        var left = 0
        
        for right in 0..<nums.count {
            sum += nums[right]
            
            while sum >= target {
                answer = min(answer, right - left + 1)
                sum -= nums[left]
                left += 1
            }
        }
        
        return answer == Int.max ? 0 : answer
    }
}
