//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 9/9/24.
//

class Solution {
    func generate(_ numRows: Int) -> [[Int]] {
        var dp = Array(repeating: Array(repeating: 1, count: numRows), count: numRows)
        var result: [[Int]] = []
        if numRows == 1 { return [[1]] }
        
        for i in 1..<numRows {
            for j in 1..<numRows-i {
                dp[i][j] = dp[i][j-1] + dp[i-1][j]
            }
        }
        
        for i in 0..<numRows {
            var line: [Int] = []
            
            for j in 0...i {
                line.append(dp[i-j][j])
            }
            
            result.append(line)
        }
        
        return result
    }
}
