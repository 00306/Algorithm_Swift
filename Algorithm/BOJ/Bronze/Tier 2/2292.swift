//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/14/24.
//




let N = Int(readLine()!)!
var sum = 0

for i in 0..<N {
    sum += i
    
    if 6*sum+2 > N {
        sum = i
        break
    }
    
    
}

print(sum+1)
