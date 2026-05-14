//
//  389479.swift
//  Algorithm
//
//  Created by 송지혁 on 5/14/26.
//

import Foundation

func solution(_ players: [Int], _ m: Int, _ k: Int) -> Int {
    var currentServer = 0
    var shutDown = [Int](repeating: 0, count: 26)
    var result = 0
    
    for i in 0..<players.count {
        currentServer -= shutDown[i]
        
        let needServer = max(players[i] / m - currentServer, 0)
        
        result += needServer
        currentServer += needServer
        shutDown[min(25, i+k)] += needServer
    }
    
    
    return result
}
