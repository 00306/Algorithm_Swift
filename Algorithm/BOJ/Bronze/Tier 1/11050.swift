//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 5/14/24.
//

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let k = input[1]

func factorial(_ n: Int) -> Int {
    return (1...max(1, n)).reduce(1, *)
}

print(factorial(n) / (factorial(n-k) * factorial(k)))
