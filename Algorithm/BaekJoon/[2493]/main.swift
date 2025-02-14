//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 2/14/25.
//

import Foundation

let n = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").map { Int($0)! }
var result = Array(repeating: 0, count: n)
var stack: [Int] = [0]

for i in 1..<n {
    while let last = stack.last, !stack.isEmpty, numbers[last] < numbers[i] {
        stack.removeLast()
    }
    
    if !stack.isEmpty, numbers[stack.last!] > numbers[i] { result[i] = stack.last! + 1 }
    
    stack.append(i)
}

print(result.map { String($0) }.joined(separator: " "))
