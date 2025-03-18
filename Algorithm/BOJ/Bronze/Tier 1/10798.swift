//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/9/24.
//

var string_arr: [[Character]] = []
var maxLength = 0
var answer = ""

for _ in 0..<5 {
    let char_arr = readLine()!.map { $0 }
    maxLength = max(maxLength, char_arr.count)
    string_arr.append(char_arr)
}

for i in 0..<maxLength {
    for j in 0..<5 {
        if string_arr[j].count < i+1 {
            continue
        } else {
            answer += String(string_arr[j][i])
        }
    }
}

print(answer)
