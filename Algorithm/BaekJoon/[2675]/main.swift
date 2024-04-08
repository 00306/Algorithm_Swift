//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/8/24.
//

let T = Int(readLine()!)!

var answer = ""

for _ in 0..<T {
    let input = readLine()!.split(separator: " ").map { $0 }
    let repeatNum = input[0]
    
    for char in input[1] {
        answer += "\(String(repeating: String(char), count: Int(repeatNum)!))"
    }
    
    answer += "\n"
}

print(answer)
