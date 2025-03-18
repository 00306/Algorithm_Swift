//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/8/24.
//

let T = Int(readLine()!)!

var answer = ""

for _ in 0..<T {
    let string = readLine()!
    let firstAndLast = String(string.first!) + String(string.last!)
    answer += "\(firstAndLast)\n"
}

print(answer)
