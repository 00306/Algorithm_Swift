//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 9/2/24.
//

let n = Int(readLine()!)!
var dp = Array(repeating: Array(repeating: 0, count: 10), count: n+2)


for i in 0..<10 {
    dp[1][i] = 1
}

for i in 1..<n+1 {
    dp[i+1][0] = dp[i+1][0] + dp[i][0]
    
    
    for j in 1..<10 {
        dp[i][j] = (dp[i][j-1] - dp[i-1][j-1] + 10007) % 10007
        dp[i+1][0] = dp[i+1][0] + dp[i][j]
    }
    
    dp[i+1][0] %= 10007
}

print(dp[n+1][0])
