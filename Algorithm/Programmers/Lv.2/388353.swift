//
//  388353.swift
//  Algorithm
//
//  Created by 송지혁 on 5/16/26.
//

import Foundation

func solution(_ storage: [String], _ requests: [String]) -> Int {
    let directions = [(-1, 0), (0, 1), (1, 0), (0, -1)]
    
    var graph = Array(repeating: [Character](repeating: "0", count: storage[0].count+2), count: storage.count+2)
    var carried = 0
    
    for i in 0..<storage.count {
        let row = Array(storage[i])
        
        for j in 0..<row.count {
            let alphabet = row[j]
            graph[i+1][j+1] = alphabet
        }
    }
    
    for request in requests {
        let target = request.first!
        
        if request.count == 1 {
            var queue = [(0, 0)]
            var visited = Array(repeating: [Bool](repeating: false,
                                                  count: graph[0].count),
                                count: graph.count)
            var head = 0
            
            while head < queue.count {
                let node = queue[head]
                head += 1
                
                for direction in directions {
                    let nextY = node.0 + direction.0
                    let nextX = node.1 + direction.1
                    
                    if nextY < 0 || nextY >= graph.count
                        || nextX < 0 || nextX >= graph[0].count {
                        continue
                    }
                    
                    if visited[nextY][nextX] { continue }
                    visited[nextY][nextX] = true
                    
                    if graph[nextY][nextX] == "0" {
                        queue.append((nextY, nextX))
                    } else if graph[nextY][nextX] == target {
                        graph[nextY][nextX] = "1"
                    }
                }
            }
            
        } else if request.count == 2 {
            for i in 1..<graph.count-1 {
                for j in 1..<graph[0].count-1 {
                    if graph[i][j] == target {
                        graph[i][j] = "1"
                    }
                }
            }
        }
        
        for i in 0..<graph.count {
            for j in 0..<graph[0].count {
                if graph[i][j] == "1" {
                    graph[i][j] = "0"
                    carried += 1
                }
            }
        }
    }
    
    return storage.count * storage[0].count - carried
}
