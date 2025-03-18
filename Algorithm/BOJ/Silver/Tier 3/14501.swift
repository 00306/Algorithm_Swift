//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 7/13/24.
//


let n = Int(readLine()!)!
var graph = Array(repeating: Array(repeating: 0, count: 1), count: 2)
var dp = Array(repeating: 0, count: n+2)

for _ in 1..<n+1 {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let t = input[0]
    let p = input[1]
    
    graph[0].append(t)
    graph[1].append(p)
}


for i in 1..<n+1 {
    if i + graph[0][i] > n + 1 { continue }
    for j in 1...i {
        dp[i + graph[0][i]] = max(dp[j] + graph[1][i], dp[i + graph[0][i]])
    }
}

print(dp.max()!)
