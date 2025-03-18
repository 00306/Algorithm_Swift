//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 6/10/24.
//

let n = Int(readLine()!)!
var dp = Array(repeating: Array(repeating: 0, count: 101), count: 101)
var result = 0


dp[0][1] = 9
for i in 1...9 {
    dp[1][i] = 1
}

if n >= 2 {
    for i in 2...n {
        dp[i][0] = dp[i-1][1]
        dp[i][9] = dp[i-1][8]
        
        for k in 1...8 {
            dp[i][k] = (dp[i-1][k-1] + dp[i-1][k+1]) % 1000000000
        }
    }
    
    
}

for i in 0...9 {
    result = (result + dp[n][i]) % 1000000000
}

print(result % 1000000000)

