//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 6/8/25.
//

let N = Int(readLine()!)!
var dp = Array(repeating: 0, count: N+1)

func findCases(width: Int) -> Int {
    if width == 1 { return 0 }

    dp[0] = 1
    dp[1] = 0
    dp[2] = 3
    
    for i in 2..<width+1 {
        dp[i] = dp[i-2] * dp[2]
        
        for j in stride(from: i-4, through: 0, by: -2) {
            dp[i] += 2 * dp[j]
        }
        
    }
    
    return dp[width]
}

print(findCases(width: N))
