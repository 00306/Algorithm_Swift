//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 2/12/25.
//

import Foundation

func solution(_ s: String) -> Int {
    var answer = s
    let numberString = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
    
    for index in 0..<numberString.count {
        answer = answer.replacingOccurrences(of: numberString[index], with: String(index))
    }
    
    return Int(answer)!
}
