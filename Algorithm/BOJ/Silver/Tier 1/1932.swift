//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 6/7/24.
//

let n = Int(readLine()!)!
var triangle: [[Int]] = []
var dp = Array(repeating: Array(repeating: 0, count: n), count: n)


for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    triangle.append(input)
}

dp[0][0] = triangle[0][0]

for i in 1..<n {
    for j in 0..<triangle[i].count {
        dp[i][j] = max(dp[i-1][max(0, j-1)], dp[i-1][j]) + triangle[i][j]
    }
    
}

print(dp.last!.max()!)
