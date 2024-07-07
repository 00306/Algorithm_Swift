//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 7/8/24.
//

let n = Int(readLine()!)!
var dp = Array(repeating: 0, count: n+1)

dp[1] = 1

if n > 1 {
    dp[2] = 3
    
    for i in 3..<n+1 {
        dp[i] = (dp[i-2] * 2 + dp[i-1]) % 10007
    }
}

print(dp[n])
