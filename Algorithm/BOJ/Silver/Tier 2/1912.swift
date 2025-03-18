//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 6/4/24.
//

let n = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").map { Int($0)! }
var dp = Array(repeating: Int.min, count: n+1)

dp[0] = numbers[0]

for i in 1..<n {
    dp[i] = max(numbers[i], numbers[i] + dp[i-1])
}

print(dp.max()!)



