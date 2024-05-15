//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 5/15/24.
//

let n = Int(readLine()!)!
let input = readLine()!.split(separator: " ").map { Int($0)! }
var lcmNumber = input[0]

if n == 1 {
  print(input[0] * input[0])
} else {
    for i in 0..<n-1 {
        lcmNumber = lcm(lcmNumber, input[i+1])
    }
    
    print(input.contains(lcmNumber) ? lcmNumber * input.min()! : lcmNumber)
}

func gcd(_ num1: Int, _ num2: Int) -> Int {
    if num1 % num2 == 0 { return num2 }
    
    
    return gcd(num2, num1 % num2)
}

func lcm(_ num1: Int, _ num2: Int) -> Int {
    return num1 * num2 / gcd(num1, num2)
}
