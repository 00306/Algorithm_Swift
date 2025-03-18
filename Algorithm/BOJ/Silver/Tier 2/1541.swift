//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 9/9/24.
//

let expression = readLine()!.split(separator: "-").map { String($0) }
var result = 0

for i in 0..<expression.count {
    let numbers = expression[i].split(separator: "+").map { Int($0)! }.reduce(0, +)
    if i == 0 { result += numbers }
    else { result -= numbers }
}

print(result)
