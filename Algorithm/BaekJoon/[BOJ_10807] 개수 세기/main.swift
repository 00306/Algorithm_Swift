//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/2/24.
//

let n = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").map { Int($0)! }
let v = Int(readLine()!)!
print(numbers.filter { $0 == v }.count)
