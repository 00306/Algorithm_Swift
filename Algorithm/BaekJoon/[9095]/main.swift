//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 6/23/24.
//

let T = Int(readLine()!)!
var numbers: [Int] = []

for _ in 0..<T {
    let number = Int(readLine()!)!
    numbers.append(number)
}

var dp = Array(repeating: 0, count: numbers.max()!+1)
dp[1] = 1
dp[2] = 2
dp[3] = 4


for i in 4..<numbers.max()!+1 {
    dp[i] = dp[i-1] + dp[i-2] + dp[i-3]
}

for number in numbers {
    print(dp[number])
}

