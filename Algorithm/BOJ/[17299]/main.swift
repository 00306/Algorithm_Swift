//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 3/1/25.
//

let n = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").map { Int($0)! }
var numberFrequency: [Int: Int] = [:]
var stack: [Int] = []
var result: [Int] = []

for number in numbers {
    numberFrequency[number, default: 0] += 1
}

for i in stride(from: n-1, through: 0, by: -1) {
    let currentNumber = numbers[i]
    
    while let last = stack.last, numberFrequency[currentNumber]! >= numberFrequency[last]! {
        stack.removeLast()
    }
    
    if stack.isEmpty {
        result.append(-1)
    } else {
        result.append(stack.last!)
    }
    
    stack.append(currentNumber)
}

print(result.map { String($0) }.reversed().joined(separator: " "))
