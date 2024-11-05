//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 11/4/24.
//

let t = Int(readLine()!)!

func minimumCost(n: Int, numbers: [Int]) -> Int {
    var prefixSum = Array(repeating: 0, count: n+1)
    
    for i in 1..<n+1 {
        prefixSum[i] = prefixSum[i-1] + numbers[i-1]
    }
    
    var dp = Array(repeating: Array(repeating: 0, count: n+1), count: n+1)
    
    for length in 2...n {
        for start in 1...(n - length + 1) {
            let end = start + length - 1
            
            dp[start][end] = Int.max
            for k in start..<end {
                let cost = dp[start][k] + dp[k+1][end] + prefixSum[end] - prefixSum[start-1]
                dp[start][end] = min(dp[start][end], cost)
            }
        }
    }
    
    
    return dp[1][n]
}

var result: [Int] = []

for _ in 0..<t {
    let k = Int(readLine()!)!
    let numbers = readLine()!.split(separator: " ").map { Int($0)! }
    
    result.append(minimumCost(n: k, numbers: numbers))
}

result.forEach { print($0) }


