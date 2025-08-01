//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 8/1/25.
//

let N = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").map { Int($0)! }

var dp = Array(repeating: [Int](repeating: 0, count: 21), count: N-1)

dp[0][numbers[0]] += 1

for i in 1..<N-1 {
    for j in 0..<21 {
        if dp[i-1][j] != 0 {
            
            if j - numbers[i] >= 0 {
                dp[i][j - numbers[i]] += dp[i-1][j]
            }
            
            if j + numbers[i] <= 20 {
                dp[i][j + numbers[i]] += dp[i-1][j]
            }
        }
    }
}

print(dp[N-2][numbers.last!])
