//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/19/24.
//

let input = readLine()!.split(separator: " ").map { Int($0)! }.sorted()


// 8ms
input[0] + input[1] > input[2] ? print(input[0] + input[1] + input[2]) : print((input[0] + input[1]) * 2 - 1)

// 12ms
// MARK: 왜 print를 밖으로 빼면 4ms가 증가할까?
//print(input[0] + input[1] > input[2] ? input[0] + input[1] + input[2] : (input[0] + input[1]) * 2 - 1)
