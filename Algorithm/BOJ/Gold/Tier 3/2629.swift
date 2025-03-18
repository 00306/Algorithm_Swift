//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 11/7/24.
//

let n = Int(readLine()!)!
let weights = readLine()!.split(separator: " ").map { Int($0)! }
let m = Int(readLine()!)!
let targets = readLine()!.split(separator: " ").map { Int($0)! }

let maxWeight = 15001

var dp = Array(repeating: Array(repeating: false, count: maxWeight + 1), count: n + 1)
dp[0][0] = true

for i in 1...n {
    for j in 0...maxWeight where dp[i-1][j] {
        dp[i][j] = dp[i-1][j]
        
        if j + weights[i-1] <= maxWeight {
            dp[i][j + weights[i-1]] = dp[i][j]
        }
        
        dp[i][abs(j - weights[i-1])] = dp[i][j]
    }
}

for target in targets {
    if target > maxWeight { print("N") }
    else if dp[n][target] { print("Y") }
    else { print("N") }
}
