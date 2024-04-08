//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/8/24.
//

let numbers = readLine()!.split(separator: " ").map { String($0.reversed()) }
print(Int(numbers[0])! > Int(numbers[1])! ? numbers[0] : numbers[1])

