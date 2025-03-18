//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/19/24.
//

let input = readLine()!.split(separator: " ").map { Int($0)! }
let a1 = input[0]
let a0 = input[1]
let c = Int(readLine()!)!
let n0 = Int(readLine()!)!

if a1 * n0 + a0 <= c * n0, c >= a1 {
    print(1)
} else {
    print(0)
}

