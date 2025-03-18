//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 8/8/24.
//

let n = Int(readLine()!)!
let prices = readLine()!.split(separator: " ").map { Int($0)! }
var dp = Array(repeating: 0, count: n+1)


for i in 1..<n+1 {
    for j in 1..<i+1 {
        dp[i] = max(dp[j] + dp[i-j], dp[i-1] + prices[0], prices[i-1], dp[i])
    }
}

print(dp[n])
