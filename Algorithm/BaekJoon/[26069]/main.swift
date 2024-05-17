//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 5/17/24.
//

let n = Int(readLine()!)!
var peopleSet: Set<String> = ["ChongChong"]

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { String($0) }
    if peopleSet.contains(input[0]) || peopleSet.contains(input[1]) {
        peopleSet.insert(input[0])
        peopleSet.insert(input[1])
    }
}

print(peopleSet.count)
