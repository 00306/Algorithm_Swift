//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/23/24.
//

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let k = input[1]
let scores = readLine()!.split(separator: " ").map { Int($0)! }.sorted(by: >)


print(scores[k-1])
