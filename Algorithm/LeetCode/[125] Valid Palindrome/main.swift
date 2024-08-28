//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 9/25/24.
//

class Solution {
    func isPalindrome(_ s: String) -> Bool {
        let trimmedString = s.lowercased().filter { $0.isLetter || $0.isNumber }.map { $0 }
        var left = 0
        var right = trimmedString.count - 1
        
        while left < right {
            if trimmedString[left] != trimmedString[right] { return false }
            left += 1
            right -= 1
        }
        
        return true
    }
}
