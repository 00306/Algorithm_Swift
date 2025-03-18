//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/13/24.
//


var T: [Int] = []
var answer = ""

while true {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    T+=input
    
    if input[0] == 0, input[1] == 0 {
        break
    }
    
    if input[0] % input[1] == 0 {
        answer += "multiple\n"
    } else if input[1] % input[0] == 0 {
        answer += "factor\n"
    } else {
        answer += "neither\n"
    }
    
}

print(answer)

