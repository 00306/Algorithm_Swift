//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 5/17/24.
//

let n = Int(readLine()!)!

func fibonacci(_ n: Int) -> Int {
    return n < 2 ? n : fibonacci(n - 1) + fibonacci(n - 2)
}

print(fibonacci(n))
