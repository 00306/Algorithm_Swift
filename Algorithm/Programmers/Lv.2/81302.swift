//
//  81302.swift
//  Algorithm
//
//  Created by 송지혁 on 6/4/26.
//

import Foundation

func checkDistance(y: Int, x: Int, distance: Int, graph: [[String]]) -> Int {
    let directions = [(-1, 0), (0, 1), (1, 0), (0, -1)]
    var queue = [(y, x, distance)]
    var head = 0
    var visited = Array(repeating: [Bool](repeating: false, count: graph[0].count), count: graph.count)
    
    while head < queue.count {
        let (currentY, currentX, remainingDistance) = queue[head]
        head += 1
        visited[currentY][currentX] = true
        if remainingDistance < 1 { continue }
        
        for (dy, dx) in directions {
            let nextX = currentX + dx
            let nextY = currentY + dy
            
            if nextX < 0 || nextX >= graph[0].count || nextY < 0 || nextY >= graph.count { continue }
            if visited[nextY][nextX] { continue }
            if graph[nextY][nextX] == "X" { continue }
            if graph[nextY][nextX] == "P" { return 0 }
            
            queue.append((nextY, nextX, remainingDistance - 1))
        }
        
    }
    
    return 1
}

func checkPlace(_ place: [String]) -> Int {
    var graph: [[String]] = []
    
    for row in place {
        let rowArray = Array(row).map { String($0) }
        graph.append(rowArray)
    }
    
    for i in 0..<graph.count {
        for j in 0..<graph[0].count {
            if graph[i][j] == "P", checkDistance(y: i, x: j, distance: 2, graph: graph) == 0 {
                return 0
            }
        }
    }
    
    return 1
}

func solution(_ places: [[String]]) -> [Int] {
    var result = [Int]()
    
    for place in places {
        let meet = checkPlace(place)
        result.append(meet)
    }
    
    return result
}
