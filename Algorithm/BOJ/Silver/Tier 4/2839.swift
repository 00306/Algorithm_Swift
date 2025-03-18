//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/22/24.
//

var n = Int(readLine()!)!
var answer = 0

while n > 2 {
    if n % 5 == 0 {
        n -= 5
    } else {
        n -= 3
    }
    
    answer += 1
    
}

print(n == 0 ? answer : -1)
