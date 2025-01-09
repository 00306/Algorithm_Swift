//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 1/9/25.
//

import Foundation

var n = readLine()!.map { Int(String($0))! }
n.sort(by: >)

var result = "-1"

let sum = n.reduce(0, +)

if let last = n.last, last == 0, sum % 3 == 0 {
    result = n.map { String($0) }.joined(separator: "")
}

print(result)
