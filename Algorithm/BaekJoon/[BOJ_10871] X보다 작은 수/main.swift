//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/3/24.
//

let input = readLine()!.split(separator: " ").map { Int($0)! }
let num_arr = readLine()!.split(separator: " ").map { Int($0)! }

print(num_arr.filter { $0 < input[1] }.map { String($0) }.joined(separator: " "))
