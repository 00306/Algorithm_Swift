//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/22/24.
//

let n = Int(readLine()!)!

var count = 0

for i in 666...Int.max {
    var num = i
    
    while num >= 666 {
        if num % 1000 == 666 {
            count += 1
            break
        } else {
            num /= 10
        }
    }
    
    if count == n {
        print(i)
        break
    }
}
