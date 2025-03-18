//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 8/24/24.
//

let t = Int(readLine()!)!
var result = ""

for _ in 0..<t {
    let n = Int(readLine()!)!
    var stickers: [[Int]] = []
    var dp = Array(repeating: Array(repeating: 0, count: n), count: 2)
    
    for _ in 0..<2 {
        let line = readLine()!.split(separator: " ").map { Int($0)! }
        stickers.append(line)
    }
    
    if n == 1 {
        result += "\(max(stickers[0][0], stickers[1][0]))\n"
        continue
    }
    
    dp[0][0] = stickers[0][0]
    dp[1][0] = stickers[1][0]
    dp[0][1] = dp[1][0] + stickers[0][1]
    dp[1][1] = dp[0][0] + stickers[1][1]
    
    for i in 2..<n {
        dp[0][i] = max(dp[1][i-1], dp[1][i-2]) + stickers[0][i]
        dp[1][i] = max(dp[0][i-1], dp[0][i-2]) + stickers[1][i]
    }
    
    result += "\(max(dp[0][n-1], dp[1][n-1]))\n"
}

print(result)
