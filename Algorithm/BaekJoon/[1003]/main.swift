//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 6/27/24.
//

let t = Int(readLine()!)!
var numbers = [Int]()

for _ in 0..<t {
    let n = Int(readLine()!)!
    numbers.append(n)
}

var maxNumber = numbers.max()!
var dp = Array(repeating: Array(repeating: 0, count: maxNumber+1), count: 2)

if maxNumber == 1 {
    print(0, 1)
} else if maxNumber == 0 {
    print(1, 0)
} else {
    
    dp[0][0] = 1
    dp[1][0] = 0
    dp[0][1] = 0
    dp[1][1] = 1
    
    for i in 2..<maxNumber+1 {
        dp[0][i] = dp[0][i-2] + dp[0][i-1]
        dp[1][i] = dp[1][i-2] + dp[1][i-1]
    }
    
    for number in numbers {
        print(dp[0][number], dp[1][number])
    }
    
}
