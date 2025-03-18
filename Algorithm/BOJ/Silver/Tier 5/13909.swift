//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 5/4/24.
//

let n = Int(readLine()!)!
var i = 1
var count = 0

while i * i <= n {
    count += 1
    i += 1
}

print(count)
