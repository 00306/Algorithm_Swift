//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 6/21/24.
//

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let k = input[1]

var sequence = readLine()!.split(separator: " ").map { Int($0)! }

for i in 1..<n {
    sequence[i] = sequence[i-1] + sequence[i]
}

var result = sequence[k-1]

for i in k..<n {
    result = max(result, sequence[i] - sequence[i-k])
}

print(result)
