//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 6/12/24.
//

let n = Int(readLine()!)!
let sequence = readLine()!.split(separator: " ").map { Int($0)! }
var dp = Array(repeating: Array(repeating: 1, count: n), count: 2)
var bitonic = Array(repeating: 1, count: n)



    for i in 0..<n {
        for j in 0..<i {
            if sequence[i] > sequence[j] {
                dp[0][i] = max(dp[0][i], dp[0][j] + 1)
            }
        }
        
        for j in n-i..<n {
            if sequence[n-i-1] > sequence[j] {
                dp[1][n-i-1] = max(dp[1][n-i-1], dp[1][j] + 1)
            }
            
        }
        
    }

if n > 1 {
    for i in 0..<n {
        bitonic[i] = dp[0][i] + dp[1][i] - 1
    }
}

print(bitonic.max()!)
