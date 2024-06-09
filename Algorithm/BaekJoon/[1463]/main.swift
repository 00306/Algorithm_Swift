//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 6/9/24.
//

let n = Int(readLine()!)!
var dp = Array(repeating: 0, count: n+1)


if n >= 3 {
    dp[2] = 1
    
    for i in 3...n {
        if i % 6 == 0 {
            dp[i] = min(dp[i/2], dp[i/3], dp[i-1]) + 1
        } else if i % 2 == 0 {
            dp[i] = min(dp[i/2], dp[i-1]) + 1
        } else if i % 3 == 0 {
            dp[i] = min(dp[i/3], dp[i-1]) + 1
        } else {
            dp[i] = dp[i-1] + 1
        }
        
    }
} else if n == 2 {
    dp[n] = 1
}

print(dp[n])
