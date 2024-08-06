//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 8/26/24.
//

import Foundation

let NK = readLine()!.split(separator: " ").map { Int($0)! }
let n = NK[0]
let k = NK[1]
var coins: [Int] = []
var dp = Array(repeating: 0, count: k+1)

for _ in 0..<n {
    let coin = Int(readLine()!)!
    coins.append(coin)
}

coins.sort()
dp[0] = 1

for coin in coins {
    if coin > k { continue }
    for i in coin..<k+1 {
        if dp[i] >= Int(pow(2.0, 31.0)) { dp[i] = 0 }
        dp[i] += dp[i-coin]
    }
}

print(dp[k])
