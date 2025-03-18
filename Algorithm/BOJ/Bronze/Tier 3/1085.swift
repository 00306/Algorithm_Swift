//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/17/24.
//

let input = readLine()!.split(separator: " ").map { Int($0)! }
let currentCoordinate = (input[0], input[1])
let vertex = (input[2], input[3])

let xDistance = min(currentCoordinate.0, vertex.0 - currentCoordinate.0)
let yDistance = min(currentCoordinate.1, vertex.1 - currentCoordinate.1)

print(min(xDistance, yDistance))
