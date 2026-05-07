//
//  42895.swift
//  Algorithm
//
//  Created by 송지혁 on 5/7/26.
//

import Foundation

func solution(_ N: Int, _ number: Int) -> Int {
    var dp = Array(repeating: Set<Int>(), count: 9)
    dp[1].insert(N)
    
    for k in 1..<9 {
        let repeated = Int(String(repeating: String(N), count: k))!
        dp[k].insert(repeated)
        
        
        for i in 1..<k {
            let j = k-i
            
            for a in dp[i] {
                for b in dp[j] {
                    dp[k].insert(a + b)
                    dp[k].insert(a - b)
                    dp[k].insert(a * b)
                    if b != 0 { dp[k].insert(a / b) }
                }
            }
        }
        
        if dp[k].contains(number) { return k }
    }
    
    return -1
}
