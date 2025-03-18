//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/8/24.
//

let string = readLine()!.map { $0 }
var answer = 0

for char in string {
    switch char {
    case "A", "B", "C":
        answer += 3
    case "D", "E", "F":
        answer += 4
    case "G", "H", "I":
        answer += 5
    case "J", "K", "L":
        answer += 6
    case "M", "N", "O":
        answer += 7
    case "P", "Q", "R", "S":
        answer += 8
    case "T", "U", "V":
        answer += 9
    case "W", "X", "Y", "Z":
        answer += 10
    default:
        break
    }

}

print(answer)

