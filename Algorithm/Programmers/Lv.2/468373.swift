//
//  468373.swift
//  Algorithm
//
//  Created by 송지혁 on 5/8/26.
//

import Foundation

func solution(_ n: Int, _ infection: Int, _ edges: [[Int]], _ k: Int) -> Int {
    
    func openPipe(type: Int, count: Int, infected: [Int]) -> Int {
        if count == 0 { return infected.count }
        
        func infect(type: Int, infected: [Int]) -> [Int] {
            var queue = infected
            var head = 0
            
            while head < queue.count {
                let node = queue[head]
                head += 1
                
                for (neighbor, nextType) in graph[node, default: []] {
                    if nextType != type { continue }
                    if queue.contains(neighbor) { continue }
                    
                    queue.append(neighbor)
                }
            }
            
            return queue
        }
        
        var currentInfection = infect(type: type, infected: infected)
        var maxInfection = 0
        
        for nextType in 1...3 {
            let infections = openPipe(type: nextType,
                                      count: count - 1,
                                      infected: currentInfection)
            
            maxInfection = max(maxInfection, infections)
        }
        
        return maxInfection
    }
    
    var result = 0
    var graph: [Int: [(Int, Int)]] = [:]
    
    for edge in edges {
        let x = edge[0]
        let y = edge[1]
        let type = edge[2]
        
        graph[x, default: []].append((y, type))
        graph[y, default: []].append((x, type))
    }
    
    for type in 1...3 {
        let infections = openPipe(type: type, count: k, infected: [infection])
        result = max(result, infections)
    }
    
    return result
}


