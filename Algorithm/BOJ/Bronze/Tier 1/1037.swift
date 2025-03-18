//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 5/15/24.
//

let n = Int(readLine()!)!
let input = readLine()!.split(separator: " ").map { Int($0)! }

print(input.min()! * input.max()!)
