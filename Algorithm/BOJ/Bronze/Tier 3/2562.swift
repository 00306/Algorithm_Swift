//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/5/24.
//

var max = 0
var index = 0

for i in 1...9 {
    let input = Int(readLine()!)!
    
    if input > max {
        max = input
        index = i
    }
}

print("\(max)\n\(index)")
