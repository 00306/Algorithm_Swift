//
//  389480.swift
//  Algorithm
//
//  Created by 송지혁 on 5/10/26.
//

import Foundation

func solution(_ info: [[Int]], _ n: Int, _ m: Int) -> Int {
    var dp = Array(repeating: [Int](repeating: Int.max, count: n),
                   count: info.count+1)
    dp[0][0] = 0
    
    for i in 0..<info.count {
        let stuff = info[i]
        let costA = stuff[0]
        let costB = stuff[1]
        
        for j in 0..<n {
            if dp[i][j] == Int.max { continue }
            
            if j+costA < n {
                dp[i+1][j+costA] = min(dp[i][j], dp[i+1][j+costA])
            }
            
            if dp[i][j] + costB < m {
                dp[i+1][j] = min(dp[i+1][j], dp[i][j] + costB)
            }
            
        }
    }
    
    for i in 0..<dp[info.count].count {
        if dp[info.count][i] != Int.max { return i }
    }
    
    return -1
    
}
