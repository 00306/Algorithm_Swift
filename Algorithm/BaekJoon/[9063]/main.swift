//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/18/24.
//

let N = Int(readLine()!)!
var maxCoordinate = (Int.min, Int.min)
var minCoordinate = (Int.max, Int.max)


for i in 0..<N {
    let coordinate = readLine()!.split(separator: " ").map { Int($0)! }
    let xCoordinate = coordinate[0]
    let yCoordinate = coordinate[1]
    
    maxCoordinate.0 = max(maxCoordinate.0, xCoordinate)
    maxCoordinate.1 = max(maxCoordinate.1, yCoordinate)
    
    
    minCoordinate.0 = min(minCoordinate.0, xCoordinate)
    minCoordinate.1 = min(minCoordinate.1, yCoordinate)
        
}

print((maxCoordinate.0 - minCoordinate.0) * (maxCoordinate.1 - minCoordinate.1))
