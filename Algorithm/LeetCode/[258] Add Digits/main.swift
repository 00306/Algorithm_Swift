//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 9/5/24.
//

class Solution {
    func addDigits(_ num: Int) -> Int {
        var number = num
        var sum = 0
        
        while true {
            while number > 0 {
                sum += number % 10
                number /= 10
            }
            
            if sum / 10 == 0 { break }
            else {
                number = sum
                sum = 0
            }
        }
        
        return sum
    }
}
