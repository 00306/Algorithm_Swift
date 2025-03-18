//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/23/24.
//

let N = Int(readLine()!)!
var answer: [Int] = []

for _ in 0..<N {
    answer.append(Int(readLine()!)!)
}

answer.sorted(by: <).forEach { print($0) }
