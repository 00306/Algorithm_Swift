//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 8/11/25.
//

let A = readLine()!.map { String($0) }
let B = readLine()!.map { String($0) }
let C = readLine()!.map { String($0) }

var dp = Array(repeating: Array(repeating: [Int](repeating: 0, count: C.count + 1), count: B.count + 1), count: A.count + 1)

for i in 1...A.count {
    for j in 1...B.count {
        for k in 1...C.count {
            if A[i-1] == B[j-1], A[i-1] == C[k-1] {
                dp[i][j][k] = dp[i-1][j-1][k-1] + 1
            } else {
                dp[i][j][k] = max(dp[i-1][j][k], dp[i][j-1][k], dp[i][j][k-1])
            }
        }
    }
}

print(dp[A.count][B.count][C.count])
