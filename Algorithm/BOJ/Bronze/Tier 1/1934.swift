//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 5/2/24.
//

let t = Int(readLine()!)!
var result = ""

for _ in 0..<t {
    let numbers = readLine()!.split(separator: " ").map { Int($0)! }
    let num1 = numbers[0]
    let num2 = numbers[1]
    
    result += "\(getLeastCommonMultiple(num1, num2))\n"
}

print(result)


// 최소 공배수 구하기
func getLeastCommonMultiple(_ num1: Int, _ num2: Int) -> Int {
    let greatestCommonFactor = gcd(num1, num2)
    
    
    return (num1 * num2) / greatestCommonFactor
}

// 최대 공약수 구하기
func gcd(_ num1: Int, _ num2: Int) -> Int {
    if num1 % num2 == 0 { return num2 }
    
    return gcd(num2, num1 % num2)
}
