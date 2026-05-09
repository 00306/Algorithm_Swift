//
//  468377.swift
//  Algorithm
//
//  Created by 송지혁 on 5/9/26.
//

import Foundation

func solution(_ cost: [[Int]], _ hint: [[Int]]) -> Int {
    let n = cost.count
    var result = Int.max
    
    for mask in 0..<(1 << n-1) {
        var totalCost = 0
        var hints = Array(repeating: 0, count: n+1)
        
        for i in 0..<n {
            totalCost += cost[i][min(hints[i+1], cost[i].count-1)]
            
            if i == n-1 { continue }
            
            if mask & (1 << i) != 0 {
                let bundle = hint[i]
                let price = bundle[0]
                
                for hint in bundle[1...] { hints[hint] += 1 }
                
                totalCost += price
            }
            
            
        }
        
        result = min(result, totalCost)
    }
    
    
    return result
}
