//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 9/3/24.
//

import Foundation

class Solution {
    func isHappy(_ n: Int) -> Bool {
        var seenNumber: Set<Int> = []
        var currentNumber = n
        
        while currentNumber != 1 && !seenNumber.contains(currentNumber)  {
            seenNumber.insert(currentNumber)
            currentNumber = sumSquareOfDigit(currentNumber)
        }
        
        return currentNumber == 1
    }
    
    func sumSquareOfDigit(_ num: Int) -> Int {
        var result = 0
        var sum = num
        
        while sum > 0 {
            let digit = sum % 10
            result += digit * digit
            sum /= 10
        }
        
        return result
    }
}
