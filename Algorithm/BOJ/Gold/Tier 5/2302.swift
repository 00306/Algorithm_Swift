//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 7/23/25.
//

let N = Int(readLine()!)!
let M = Int(readLine()!)!
var dp = Array(repeating: [0, 0], count: N+1)

for _ in 0..<M {
    let fix = Int(readLine()!)!
    dp[fix][1] = 1
}

func findAllSeatCases(n: Int, dp: inout [[Int]]) -> Int {
    if n == 1 { return 1 }
    
    dp[1][0] = 1
    dp[2][0] = dp[1][1] == 1 || dp[2][1] == 1 ? 1 : 2
    
    for i in 3..<N+1 {
        if dp[i][1] == 1 || dp[i-1][1] == 1 {
            dp[i][0] = dp[i-1][0]
        } else {
            dp[i][0] = dp[i-1][0] + dp[i-2][0]
        }
    }

    return dp[N][0]
}


print(findAllSeatCases(n: N, dp: &dp))
