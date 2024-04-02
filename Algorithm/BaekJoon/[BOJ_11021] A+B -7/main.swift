//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/2/24.
//

let T = Int(readLine()!)!
var answer = ""

for i in 1...T {
    let numbers = readLine()!.split(separator: " ").map { Int($0)! }
    answer += "Case #\(i): \(numbers.reduce(0, +))\n"
}


print(answer)
