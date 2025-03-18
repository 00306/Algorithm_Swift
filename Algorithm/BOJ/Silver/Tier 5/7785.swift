//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/27/24.
//

let n = Int(readLine()!)!
var logs: [String: String] = [:]

var current = [String()]

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { String($0) }
    logs[input[0]] = input[1]
}

for log in logs {
    if log.value == "enter" {
        current.append(log.key)
    }
}

current.sorted(by: >).forEach { print($0) }
