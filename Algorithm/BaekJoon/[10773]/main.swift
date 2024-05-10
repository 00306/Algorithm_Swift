//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 5/10/24.
//

let k = Int(readLine()!)!
var array: [Int] = []

for _ in 0..<k {
    let n = Int(readLine()!)!
    
    switch n {
    case 0:
        array.removeLast()
    default:
        array.append(n)
    }
}

print(array.reduce(0, +))
