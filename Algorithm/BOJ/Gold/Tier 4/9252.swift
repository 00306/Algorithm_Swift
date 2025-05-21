//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 6/8/25.
//

let firstSequence = readLine()!.map { String($0) }
let secondSequence = readLine()!.map { String($0) }
let n = firstSequence.count
let m = secondSequence.count

var dp = Array(repeating: [Int](repeating: 0, count: secondSequence.count+1), count: firstSequence.count+1)

for i in 1...n {
    for j in 1...m {
        if firstSequence[i-1] == secondSequence[j-1] {
            dp[i][j] = dp[i-1][j-1] + 1
        } else {
            dp[i][j] = max(dp[i][j-1], dp[i-1][j])
        }
    }
}

var i = n
var j = m
var lcs = ""

while i > 0 && j > 0 {
    if firstSequence[i-1] == secondSequence[j-1] {
        lcs.append(firstSequence[i-1])
        i -= 1
        j -= 1
    } else if dp[i][j-1] >= dp[i-1][j] {
        j -= 1
    } else {
        i -= 1
    }
}

print(dp[n][m], String(lcs.reversed()), separator: "\n")
