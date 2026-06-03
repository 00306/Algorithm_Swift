//
//  86052.swift
//  Algorithm
//
//  Created by 송지혁 on 6/3/26.
//

import Foundation

func nextDirection(prev: (Int, Int), direction: String) -> (Int, Int) {
    if direction == "S" { return prev }
    else if direction == "L" {
        if prev == (1, 0) {
            return (0, 1)
        } else if prev == (-1, 0) {
            return (0, -1)
        } else if prev == (0, 1) {
            return (-1, 0)
        } else if prev == (0, -1) {
            return (1, 0)
        }
    } else if direction == "R" {
        if prev == (1, 0) {
            return (0, -1)
        } else if prev == (-1, 0) {
            return (0, 1)
        } else if prev == (0, 1) {
            return (1, 0)
        } else if prev == (0, -1) {
            return (-1, 0)
        }
    }
    
    return (0, 0)
}

func solution(_ grid: [String]) -> [Int] {
    let directions = [(-1, 0), (0, 1), (1, 0), (0, -1)]
    
    var graph: [[String]] = []
    
    for i in 0..<grid.count {
        let rowArray = Array(grid[i]).map { String($0) }
        graph.append(rowArray)
    }
    
    var visited = Array(repeating: Array(repeating: Array(repeating: false, count: 4),
                                         count: graph[0].count),
                        count: graph.count)
    var result: [Int] = []
    
    for i in 0..<graph.count {
        for j in 0..<graph[0].count {
            
            for k in 0..<directions.count {
                var currentX = j
                var currentY = i
                var direction = directions[k]
                var count = 0
                
                if visited[i][j][k] { continue }
                visited[i][j][k] = true
                
                while true {
                    let (dy, dx) = nextDirection(prev: direction,
                                                 direction: graph[currentY][currentX])
                    direction = (dy, dx)
                    var nextX = currentX + dx
                    var nextY = currentY + dy
                    
                    if nextX < 0 { nextX = graph[0].count - 1 }
                    if nextX >= graph[0].count { nextX = 0 }
                    if nextY < 0 { nextY = graph.count - 1 }
                    if nextY >= graph.count { nextY = 0 }
                    
                    let dirIndex = directions.firstIndex(where: { $0 == direction })!
                    if nextY == i, nextX == j, dirIndex == k {
                        result.append(count+1)
                        break
                    }
                    
                    if visited[nextY][nextX][dirIndex] { break }
                    visited[nextY][nextX][dirIndex] = true
                    
                    count += 1
                    currentX = nextX
                    currentY = nextY
                    
                    
                    
                }
            }
        }
    }
    
    return result.sorted()
}
