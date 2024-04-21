//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/21/24.
//

let input = readLine()!.split(separator: " ").map { Int($0)! }
let a = input[0]
let b = input[1]
let c = input[2]
let d = input[3]
let e = input[4]
let f = input[5]

var x = 0
var y = 0

for i in -999...999 {
    for j in -999...999 {
        if a * i + b * j == c, d * i + e * j == f {
            x = i
            y = j
            print(x, y)
            break
        }
    }
}


