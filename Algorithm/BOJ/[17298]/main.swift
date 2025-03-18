//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 2/14/25.
//

import Foundation

let n = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").map { Int($0)! }
var result = Array(repeating: -1, count: n)
var stack: [Int] = []

for i in 0..<n {
    while !stack.isEmpty && numbers[stack.last!] < numbers[i] {
        let index = stack.removeLast()
        result[index] = numbers[i]
    }
    
    stack.append(i)
}

print(result.map { String($0) }.joined(separator: " "))

