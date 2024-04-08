//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/9/24.
//

var arr = [Int]()

for _ in 0..<28 {
    arr.append(Int(readLine()!)!)
}

(1...30).filter { !arr.contains($0) }.sorted(by: <).forEach { print($0) }
