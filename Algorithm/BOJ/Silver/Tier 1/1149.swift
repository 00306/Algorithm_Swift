//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 6/6/24.
//

let n = Int(readLine()!)!
var cost: [[Int]] = []
var dp = Array(repeating: Array(repeating: 0, count: n+1), count: 3)

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    cost.append(input)
}

dp[0][0] = cost[0][0]
dp[1][0] = cost[0][1]
dp[2][0] = cost[0][2]

for i in 1..<n {
    dp[0][i] = min(dp[1][i-1], dp[2][i-1]) + cost[i][0]
    dp[1][i] = min(dp[0][i-1], dp[2][i-1]) + cost[i][1]
    dp[2][i] = min(dp[1][i-1], dp[0][i-1]) + cost[i][2]
}

print(min(dp[0][n-1], dp[1][n-1], dp[2][n-1]))
