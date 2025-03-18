//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/8/24.
//

let input = readLine()!.split(separator: " ").map { Int($0)! }
var pieces = [1, 1, 2, 2, 2, 8]
var answer: [String] = Array(repeating: "", count: 6)

for i in 0..<pieces.count {
    answer[i] = String(pieces[i]-input[i])
}

print(answer.joined(separator: " "))
