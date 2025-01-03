//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 1/3/25.
//

import Foundation

let n = Int(readLine()!)!
var ropes: [Int] = []
var result = Int.min

for _ in 0..<n {
    let rope = Int(readLine()!)!
    ropes.append(rope)
}

ropes.sort(by: >)

for i in 0..<n {
    result = max(result, ropes[i] * (i+1))
}

print(result)
