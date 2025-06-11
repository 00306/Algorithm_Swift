//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 6/11/25.
//

let N = Int(readLine()!)!
var numbers: [Int] = []
var dp = Array(repeating: 1, count: N)

for _ in 0..<N {
    let number = Int(readLine()!)!
    numbers.append(number)
}

for i in 1..<N {
    for j in 0..<i {
        if numbers[i] > numbers[j] {
            dp[i] = max(dp[i], dp[j]+1)
        }
    }
}

print(N - dp.max()!)
