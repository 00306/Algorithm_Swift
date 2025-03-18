//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/1/24.
//

let n = Int(readLine()!)!

for _ in 1...n {
    let numbers = readLine()!.split(separator: " ").map { Int($0)! }
    print(numbers.reduce(0, +))
}
