//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 6/14/24.
//

let n = Int(readLine()!)!
var wirePosition: [[Int]] = []
var dp = Array(repeating: 1, count: n)

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    
    wirePosition.append(input)
}

var sortedPosition = wirePosition.sorted(by: { $0[0] < $1[0] })

for i in 1..<n {
    for j in 0..<i {
        if sortedPosition[i][1] > sortedPosition[j][1] {
            dp[i] = max(dp[i], dp[j]+1)
        }
    }
}

print(n-dp.max()!)
