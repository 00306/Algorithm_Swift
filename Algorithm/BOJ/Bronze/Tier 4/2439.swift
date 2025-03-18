//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/2/24.
//

let n = Int(readLine()!)!

for i in 1...n {
    print(String(repeating: " ", count: n-i), terminator: "")
    print(String(repeating: "*", count: i))
}
