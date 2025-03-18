//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 9/9/24.
//

let n = Int(readLine()!)!
var p = readLine()!.split(separator: " ").map { Int($0)! }

p.sort()
var result = p[0]

for i in 1..<n {
    p[i] += p[i-1]
    result += p[i]
}

print(result)
