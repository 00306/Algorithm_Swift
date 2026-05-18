//
//  468372.swift
//  Algorithm
//
//  Created by 송지혁 on 5/18/26.
//

import Foundation

func solution(_ dist_limit: Int, _ split_limit: Int) -> Int {
    var result = 0
    
    for a in 0..<30 {
        for b in 0..<19 {
            var score = 1
            var over = false
            for _ in 0..<a {
                score *= 2
                if score > split_limit {
                    over = true
                    break
                }
            }
            if over {
                break
            }
            for _ in 0..<b {
                score *= 3
                if score > split_limit {
                    over = true; break
                }
            }
            
            if over { break }
            
            var nodes = 1
            var budget = dist_limit
            var leaves = 0
            
            for i in 0..<a {
                if budget >= nodes {
                    budget -= nodes
                    nodes *= 2
                } else {
                    leaves += (nodes - budget) + budget * 2
                    nodes = 0
                    break
                }
            }
            
            for j in 0..<b {
                if budget >= nodes {
                    budget -= nodes
                    nodes *= 3
                } else {
                    leaves += (nodes - budget) + budget * 3
                    nodes = 0
                    break
                }
            }
            
            leaves += nodes
            result = max(result, leaves)
            
        }
    }
    
    return result
}
