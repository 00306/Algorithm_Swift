//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 1/18/26.
//

let N = Int(readLine()!)!
var weights = readLine()!.split(separator: " ").map { Int($0)! }

weights.sort()

var current = 0

for weight in weights {
    if weight > current + 1 {
        break
    }
    
    current += weight
}

print(current + 1)
