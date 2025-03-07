//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 3/5/25.
//

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0]
let m = nm[1]

let memories = readLine()!.split(separator: " ").map { Int($0)! }
let costs = readLine()!.split(separator: " ").map { Int($0)! }
let costSum = costs.reduce(0, +)

var dp = Array(repeating: 0, count: costSum + 1)
var result = 0


for j in 0..<n {
    for i in stride(from: costSum, through: costs[j], by: -1) {
        dp[i] = max(dp[i], dp[i - costs[j]] + memories[j])
    }
}

for i in 0..<costSum + 1 {
    if dp[i] >= m {
        result = i
        break
    }
}

print(result)
