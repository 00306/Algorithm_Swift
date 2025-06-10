//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 6/11/25.
//

let NM = readLine()!.split(separator: " ").map { Int($0)! }
let N = NM[0]
let M = NM[1]

var graph: [[Int]] = []
var dp = Array(repeating: [Int](repeating: 0, count: M+1), count: N+1)

for _ in 0..<N {
    let input = readLine()!.map { Int(String($0))! }
    graph.append(input)
}

for i in 1..<N+1 {
    for j in 1..<M+1 where graph[i-1][j-1] == 1 {
        dp[i][j] = min(dp[i-1][j], dp[i][j-1], dp[i-1][j-1]) + 1
    }
}

let width = dp.flatMap { $0 }.max()!
print(width * width)
