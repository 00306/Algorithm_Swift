//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 5/3/24.
//

let input1 = readLine()!.split(separator: " ").map { Int($0)! }
let input2 = readLine()!.split(separator: " ").map { Int($0)! }

let fraction1 = (input1[0], input1[1])
let fraction2 = (input2[0], input2[1])
let lcm = fraction1.1 * fraction2.1 / gcd(num1: fraction1.1, num2: fraction2.1)

let sum = (fraction1.0 * lcm / fraction1.1 + fraction2.0 * lcm / fraction2.1, lcm)

let fraction3Gcd = gcd(num1: sum.0, num2: sum.1)
print(sum.0 / fraction3Gcd, sum.1 / fraction3Gcd)


func gcd(num1: Int, num2: Int) -> Int {
    if num1 % num2 == 0 { return num2 }
    
    return gcd(num1: num2, num2: num1 % num2)
}
