//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/2/24.
//

var answer = ""
var numbers = readLine()!.split(separator: " ").map { Int($0)! }

while numbers.reduce(0, +) != 0 {
    answer += "\(numbers.reduce(0, +))\n"
    numbers = readLine()!.split(separator: " ").map { Int($0)! }
}

print(answer)
