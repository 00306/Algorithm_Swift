//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/14/24.
//

let input = readLine()!.split(separator: " ").map { Int($0)! }
let A = input[0]
let B = input[1]
let V = input[2]


if ((V-A)/(A-B))*(A-B) + A >= V {
    print((V-A)/(A-B)+1)
} else {
    print((V-A)/(A-B)+2)
}
