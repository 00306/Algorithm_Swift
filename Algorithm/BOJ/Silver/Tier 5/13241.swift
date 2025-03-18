//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 5/3/24.
//

let input = readLine()!.split(separator: " ").map { Int($0)! }
let a = input[0]
let b = input[1]

print(a * b / gcd(num1: a, num2: b))

func gcd(num1: Int, num2: Int) -> Int {
    if num1 % num2 == 0 { return num2 }
    
    return gcd(num1: num2, num2: num1 % num2)
}
