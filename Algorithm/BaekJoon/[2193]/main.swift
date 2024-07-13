//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 7/14/24.
//

let n = Int(readLine()!)!
var dp = Array(repeating: 0, count: n+1)
dp[0] = 1
dp[1] = 1

for i in 2..<n+1 {
    dp[i] = dp[i-2] + dp[i-1]
}

print(dp[n-1])
