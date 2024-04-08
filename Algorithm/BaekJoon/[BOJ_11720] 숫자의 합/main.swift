//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/8/24.
//

let N = Int(readLine()!)!
let number = readLine()!
var answer: Int = 0

for n in number {
    answer += n.wholeNumberValue!
}

print(answer)

