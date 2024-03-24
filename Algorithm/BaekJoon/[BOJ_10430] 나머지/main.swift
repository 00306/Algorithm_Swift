//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 3/11/24.
//
import Foundation

guard let input = readLine()?.split(separator: " ").compactMap({ Int($0) }), input.count >= 3, 
        let A = input.first, let B = input.dropFirst().first, let C = input.dropFirst(2).first, 
        (2...10000).contains(where: { $0 == A || $0 == B || $0 == C }) else { exit(1) }

let result1 = (A + B) % C
let result2 = ((A % C) + (B % C)) % C
let result3 = (A * B) % C
let result4 = ((A % C) * (B % C)) % C

print(result1)
print(result2)
print(result3)
print(result4)



