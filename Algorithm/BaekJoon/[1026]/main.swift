//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 12/16/24.
//

let n = Int(readLine()!)!
let A = readLine()!.split(separator: " ").map { Int($0)! }
let B = readLine()!.split(separator: " ").map { Int($0)! }

let sortedA = A.sorted()
let sortedB = B.sorted(by: >)

var result = 0
for i in 0..<sortedA.count {
    result += sortedA[i] * sortedB[i]
}

print(result)
