//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/22/24.
//

let n = Int(readLine()!)!
var answer = Int.max

for i in 0...n/5 {
    let x = n/5 - i
    let y = (n - 5*x)/3
    
    if 5*x+3*y == n {
        answer = min(answer, x+y)
    }
}

if answer == Int.max {
    answer = -1
}

print(answer)


//3 5
