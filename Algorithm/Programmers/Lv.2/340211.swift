//
//  340211.swift
//  Algorithm
//
//  Created by 송지혁 on 5/20/26.
//

import Foundation

func findAllMoves(start: [Int], end: [Int]) -> [[Int]] {
    let vector = [(end[0] - start[0]), (end[1] - start[1])]
    var moves: [[Int]] = []
    
    for _ in 0..<abs(vector[0]) {
        if vector[0] > 0 {
            moves.append([1, 0])
        } else {
            moves.append([-1, 0])
        }
    }
    
    for _ in 0..<abs(vector[1]) {
        if vector[1] > 0 {
            moves.append([0, 1])
        } else {
            moves.append([0, -1])
        }
    }
    
    return moves
}

func solution(_ points: [[Int]], _ routes: [[Int]]) -> Int {
    var robotMoves: [Int: [[Int]]] = [:]
    var position: [[Int]] = Array(repeating: [], count: routes.count)
    
    for robot in 0..<routes.count {
        let route = routes[robot]
        let start = route[0]
        let point = points[start-1]
        position[robot] = point.map { $0 - 1 }
        
        
        for next in 1..<route.count {
            let move = findAllMoves(start: points[route[next-1]-1],
                                    end: points[route[next]-1])
            
            robotMoves[robot, default: []] += move
        }
    }
    
    var head = 0
    var time = 0
    var count = 0
    
    while true {
        var isChange = false
        
        
        for coordinate in Set(position) {
            if coordinate == [-1, -1] { continue }
            var same = 0
            
            for i in 0..<routes.count {
                if position[i] == coordinate {
                    same += 1
                }
            }
            
            if same > 1 { count += 1 }
        }
        
        for i in 0..<routes.count {
            if let moves = robotMoves[i], moves.count > time {
                isChange = true
                let move = moves[time]
                
                position[i] = [position[i][0] + move[0], position[i][1] + move[1]]
            } else {
                position[i] = [-1, -1]
            }
        }
        
        if !isChange { break }
        
        
        time += 1
    }
    
    
    return count
}
