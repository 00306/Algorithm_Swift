//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 6/11/25.
//

let N = Int(readLine()!)!

var costs: [[Int]] = []

for _ in 0..<N {
    let cost = readLine()!.split(separator: " ").map { Int($0)! }
    costs.append(cost)
}

func getDpTable(firstColor: Int) -> [[Int]] {
    var dp = Array(repeating: [Int](repeating: 0, count: 3), count: N+1)
    
    for j in 0..<3 {
        if j == firstColor {
            dp[1][j] = costs[0][j]
        } else {
            dp[1][j] = Int.max
        }
    }
    
    for i in 2..<N {
        for j in 0..<3 {
            let a = dp[i-1][(j+1)%3]
            let b = dp[i-1][(j+2)%3]
            
            if a == Int.max && b == Int.max {
                dp[i][j] = Int.max
            } else {
                dp[i][j] = min(a, b) + costs[i-1][j]
            }
            
            
        }
    }
    
    return dp
}

var result = Int.max

for i in 0..<3 {
    let dp = getDpTable(firstColor: i)
    
    for j in 0..<3 where j != i {
        for k in 0..<3 where j != k {
            if dp[N-1][k] != Int.max {
                let cost = dp[N-1][k] + costs[N-1][j]
                result = min(result, cost)
            }
        }
    }
}

print(result)



