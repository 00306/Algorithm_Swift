//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 6/15/24.
//

let firstSequence = readLine()!.map { String($0) }
let secondSequence = readLine()!.map { String($0) }

let firstSequenceLength = firstSequence.count
let secondSequenceLength = secondSequence.count
var lcs = Array(repeating: Array(repeating: 0, count: secondSequenceLength + 1), count: firstSequenceLength + 1)


for i in 1..<firstSequenceLength+1 {
    for j in 1..<secondSequenceLength+1 {
        if firstSequence[i-1] == secondSequence[j-1] {
            lcs[i][j] = lcs[i-1][j-1] + 1
        } else {
            lcs[i][j] = max(lcs[i-1][j], lcs[i][j-1])
        }
    }
}

print(lcs[firstSequenceLength][secondSequenceLength])
