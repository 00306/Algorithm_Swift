//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/25/24.
//


let n = Int(readLine()!)!
var cards = Dictionary(uniqueKeysWithValues: readLine()!.split(separator: " ").map { (Int($0)!, 0) })


let m = Int(readLine()!)
var findings = readLine()!.split(separator: " ").map { Int($0)! }

var answer = ""

for num in findings {
    if cards[num] == nil {
        answer += "0 "
    } else {
        answer += "1 "
    }
}

print(answer)
