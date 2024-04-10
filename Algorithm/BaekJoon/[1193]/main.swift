//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/10/24.
//


let N = Int(readLine()!)!
var anchor = 0
var distance = 0
var count = 0

for i in 1...N {
    if anchor+i >= N {
        distance = N - anchor - 1
        count = i
        break
    }
    
    anchor += i
}


if count % 2 == 0 {
    print("\(1 + distance)/\(count - distance)")
} else {
    print("\(count - distance)/\(1 + distance)")
}
