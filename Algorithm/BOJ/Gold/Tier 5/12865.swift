//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 6/18/24.
//

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let k = input[1]
var things: [(Int, Int)] = []
var dp = Array(repeating: Array(repeating: 0, count: k+1), count: n+1)


for _ in 0..<n {
    let thing = readLine()!.split(separator: " ").map { Int($0)! }
    things.append((thing[0], thing[1]))
}


for i in 1...n {
    for j in 1...k {
        if things[i-1].0 <= j {
            dp[i][j] = max(dp[i-1][j], dp[i-1][j-things[i-1].0] + things[i-1].1)
        } else {
            dp[i][j] = dp[i-1][j]
        }
    }
}

print(dp[n][k])
