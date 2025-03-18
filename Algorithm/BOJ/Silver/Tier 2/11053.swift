//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 6/11/24.
//

let n = Int(readLine()!)!
let sequence = readLine()!.split(separator: " ").map { Int($0)! }
var dp = Array(repeating: 1, count: n)

for i in 1..<sequence.count {
    for j in 0..<i {
        if sequence[j] < sequence[i] {
            dp[i] = max(dp[i], dp[j] + 1)
        }
    }
}

print(dp.max()!)

