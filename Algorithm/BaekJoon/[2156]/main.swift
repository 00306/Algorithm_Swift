//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 6/10/24.
//

let n = Int(readLine()!)!
var wines = [Int]()
var dp = Array(repeating: 0, count: n)
var maxValue = 0

for _ in 0..<n {
    let input = Int(readLine()!)!
    wines.append(input)
}

print(drink())

func drink() -> Int {
    if n == 1 { return wines[0] }
    if n == 2 { return wines[0] + wines[1] }

    dp[0] = wines[0]
    dp[1] = wines[0] + wines[1]
    
    if wines[2] == 0 {
        dp[2] = dp[1]
    } else {
        dp[2] = max(wines[0] + wines[2], wines[1] + wines[2], dp[1])
    }
    
    maxValue = dp.max()!
    
    for i in 3..<n {
        if wines[i] == 0 {
            dp[i] = dp[i-1]
        } else {
            dp[i] = max(wines[i-1] + dp[i-3] + wines[i], dp[i-2] + wines[i], maxValue)
        }
        
        maxValue = dp[i]
    }
    
    return dp.max()!
}
