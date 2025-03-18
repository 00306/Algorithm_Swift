//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 9/12/24.
//

let ABC = readLine()!.split(separator: " ").map { Int($0)! }
let A = ABC[0]
let B = ABC[1]
let C = ABC[2]

func recursion(a: Int, b: Int, c: Int) -> Int {
    if b == 1 { return a }
    
    if b % 2 != 0 { return a * recursion(a: a, b: b-1, c: c) }
    
    let half = recursion(a: a, b: b/2, c: c) % c
    return half * half % c
}

print(recursion(a: A, b: B, c: C) % C)
