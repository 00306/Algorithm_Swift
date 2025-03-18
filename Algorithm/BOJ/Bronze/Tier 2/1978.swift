//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/16/24.
//
import Foundation

let N = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").map { Int($0)! }
var answer = 0

for num in numbers {
    var set: Set<Int> = []
    
    for i in 1...Int(sqrt(Double(num))) {
        if num % i == 0 {
            set.insert(i)
            set.insert(num/i)
        }
    }
    
    if set.count == 2 {
        answer += 1
    }
    
    
}

print(answer)
