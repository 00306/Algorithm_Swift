//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 6/8/24.
//

let n = Int(readLine()!)!
var stairs = [Int]()
var dp = Array(repeating: 0, count: 300)

for _ in 0..<n {
    let input = Int(readLine()!)!
    stairs.append(input)
}


func climb() -> Int {
    if n == 1 { return stairs[0] }
    if n == 2 { return stairs[0] + stairs[1] }
    if n == 3 { return max(stairs[0]+stairs[2], stairs[1]+stairs[2]) }
    
    dp[0] = stairs[0]
    dp[1] = stairs[0] + stairs[1]
    dp[2] = max(stairs[0]+stairs[2], stairs[1]+stairs[2])
    
    for i in 3..<n {
        dp[i] = max(stairs[i] + stairs[i-1] + dp[i-3], stairs[i] + dp[i-2])
    }
    
    return dp[n-1]
}

print(climb())
