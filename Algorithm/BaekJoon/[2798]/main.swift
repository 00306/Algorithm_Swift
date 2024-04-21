//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/21/24.
//

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let m = input[1]

let cards = readLine()!.split(separator: " ").map { Int($0)! }
var answer = 0


for i in 0..<n {
    for j in i+1..<n {
        for k in j+1..<n {
            if cards[i] + cards[j] + cards[k] <= m {
              answer = max(answer, cards[i] + cards[j] + cards[k])
            }
        }
    }
}

print(answer)
