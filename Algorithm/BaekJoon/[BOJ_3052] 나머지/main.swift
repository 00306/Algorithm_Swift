//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/5/24.
//

var num_set: Set<Int> = []

for _ in 0..<10 {
    let num = Int(readLine()!)!
    num_set.insert(num % 42)
}


print(num_set.count)
