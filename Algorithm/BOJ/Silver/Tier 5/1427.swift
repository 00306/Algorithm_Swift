//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/23/24.
//

let n = readLine()!.map { Int(String($0))! }.sorted(by: >)
print(n.map { String($0) }.joined(separator: ""))



