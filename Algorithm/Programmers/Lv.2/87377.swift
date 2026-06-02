//
//  87377.swift
//  Algorithm
//
//  Created by 송지혁 on 6/2/26.
//

import Foundation

func findIntegerIntersection(_ a1: Int, _ b1: Int, _ c1: Int,
                             _ a2: Int, _ b2: Int, _ c2: Int) -> (Int, Int)? {
    if a1 * b2 - b1 * a2 == 0 { return nil }
    
    let x = Double(b1*c2 - c1*b2) / Double(a1*b2 - b1*a2)
    let y = Double(c1*a2 - a1*c2) / Double(a1*b2 - b1*a2)
    
    if Double(Int(x)) != x || Double(Int(y)) != y { return nil }
    
    return (Int(y), Int(x))
}

func solution(_ line: [[Int]]) -> [String] {
    var coordinates: [(Int, Int)] = []
    var minX = Int.max
    var maxX = Int.min
    var minY = Int.max
    var maxY = Int.min
    
    for i in 0..<line.count {
        for j in i+1..<line.count {
            guard let intersection = findIntegerIntersection(line[i][0], line[i][1], line[i][2], line[j][0], line[j][1], line[j][2]) else { continue }
            
            minY = min(minY, intersection.0)
            maxY = max(maxY, intersection.0)
            minX = min(minX, intersection.1)
            maxX = max(maxX, intersection.1)
            
            coordinates.append(intersection)
        }
    }
    
    var grid = Array(repeating: [String](repeating: ".",
                                         count: abs(maxX-minX) + 1),
                     count: abs(maxY-minY) + 1)
    
    
    for i in 0..<coordinates.count {
        coordinates[i].0 -= minY
        coordinates[i].1 -= minX
        
        grid[coordinates[i].0][coordinates[i].1] = "*"
    }
    
    grid.reverse()
    
    return grid.flatMap { $0.joined(separator: "") }
}
