//
//  49994.swift
//  Algorithm
//
//  Created by 송지혁 on 8/1/26.
//

import Foundation

struct Move: Equatable, Hashable {
    let startX: Int
    let startY: Int
    let endX: Int
    let endY: Int
    
}

func isValidCoordinate(_ coordinate: (Int, Int), boundary: Int) -> Bool {
    if abs(coordinate.0) > boundary || abs(coordinate.1) > boundary { return false }
    
    return true
}

func solution(_ dirs: String) -> Int {
    var currentCoordinate = (0, 0)
    let moves = dirs.map { String($0) }
    var visited: Set<Move> = []
    var result = 0
    
    print(moves)
    for move in moves {
        
        if move == "U" {
            let nextCoordinate = (currentCoordinate.0 + 1, currentCoordinate.1)
            if isValidCoordinate(nextCoordinate, boundary: 5) {
                let move = Move(startX: currentCoordinate.1,
                                startY: currentCoordinate.0,
                                endX: nextCoordinate.1,
                                endY: nextCoordinate.0)
                
                let reversed = Move(startX: nextCoordinate.1,
                                    startY: nextCoordinate.0,
                                    endX: currentCoordinate.1,
                                    endY: currentCoordinate.0)
                
                if !visited.contains(move) || !visited.contains(reversed) {
                    visited.insert(move)
                    visited.insert(reversed)
                    result += 1
                }
                
                currentCoordinate = nextCoordinate
            }
            
        } else if move == "D" {
            let nextCoordinate = (currentCoordinate.0 - 1, currentCoordinate.1)
            if isValidCoordinate(nextCoordinate, boundary: 5) {
                let move = Move(startX: currentCoordinate.1,
                                startY: currentCoordinate.0,
                                endX: nextCoordinate.1,
                                endY: nextCoordinate.0)
                
                let reversed = Move(startX: nextCoordinate.1,
                                    startY: nextCoordinate.0,
                                    endX: currentCoordinate.1,
                                    endY: currentCoordinate.0)
                
                if !visited.contains(move) || !visited.contains(reversed) {
                    visited.insert(move)
                    visited.insert(reversed)
                    result += 1
                }
                
                currentCoordinate = nextCoordinate
            }
        } else if move == "L" {
            let nextCoordinate = (currentCoordinate.0, currentCoordinate.1 - 1)
            if isValidCoordinate(nextCoordinate, boundary: 5) {
                let move = Move(startX: currentCoordinate.1,
                                startY: currentCoordinate.0,
                                endX: nextCoordinate.1,
                                endY: nextCoordinate.0)
                
                let reversed = Move(startX: nextCoordinate.1,
                                    startY: nextCoordinate.0,
                                    endX: currentCoordinate.1,
                                    endY: currentCoordinate.0)
                
                if !visited.contains(move) || !visited.contains(reversed) {
                    visited.insert(move)
                    visited.insert(reversed)
                    result += 1
                }
                
                currentCoordinate = nextCoordinate
            }
        } else if move == "R" {
            let nextCoordinate = (currentCoordinate.0, currentCoordinate.1 + 1)
            if isValidCoordinate(nextCoordinate, boundary: 5) {
                let move = Move(startX: currentCoordinate.1,
                                startY: currentCoordinate.0,
                                endX: nextCoordinate.1,
                                endY: nextCoordinate.0)
                
                let reversed = Move(startX: nextCoordinate.1,
                                    startY: nextCoordinate.0,
                                    endX: currentCoordinate.1,
                                    endY: currentCoordinate.0)
                
                if !visited.contains(move) || !visited.contains(reversed) {
                    visited.insert(move)
                    visited.insert(reversed)
                    result += 1
                }
                
                currentCoordinate = nextCoordinate
            }
        }
    }
    
    return result
}
