//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/8/24.
//

let input = readLine()!.split(separator: " ").map { Int($0)! }
let pieces = [1, 1, 2, 2, 2, 8]
var answer = ""

for i in 0..<pieces.count {
    answer += "\(String(pieces[i]-input[i])) "
}

print(answer)
