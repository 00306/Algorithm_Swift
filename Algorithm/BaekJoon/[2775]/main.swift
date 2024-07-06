//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 7/6/24.
//

let t = Int(readLine()!)!
var dp = Array(repeating: Array(repeating: 0, count: 15), count: 15)
var testCases: [(Int, Int)] = []
var result = ""

for i in 1...14 {
    dp[0][i] = i
}

for _ in 0..<t {
    let k = Int(readLine()!)!
    let n = Int(readLine()!)!
    testCases.append((k, n))
    
}

let maxK = testCases.map { $0.0 }.max()!
let maxN = testCases.map { $0.1 }.max()!


for i in 1...maxK {
    for j in 1...maxN {
        dp[i][j] = dp[i][j-1] + dp[i-1][j]
    }
}

for testCase in testCases {
    result += "\(dp[testCase.0][testCase.1])\n"
}

print(result)
