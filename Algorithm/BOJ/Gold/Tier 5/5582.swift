//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 7/26/25.
//

let s = readLine()!.map { $0 }
let t = readLine()!.map { $0 }

var dp = Array(repeating: [Int](repeating: 0, count: t.count+1), count: s.count+1)
var maxLength = 0

for i in 1...s.count {
    for j in 1...t.count {
        if s[i-1] == t[j-1] {
            dp[i][j] = dp[i-1][j-1] + 1
            maxLength = max(maxLength, dp[i][j])
        }
    }
}

print(maxLength)
