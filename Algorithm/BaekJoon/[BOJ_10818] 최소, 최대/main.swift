//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/4/24.
//

let n = Int(readLine()!)!
let number_array = readLine()!.split(separator: " ").map { Int($0)! }

print(number_array.min()!, number_array.max()!)
