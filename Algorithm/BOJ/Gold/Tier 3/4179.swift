//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 5/12/25.
//

let RC = readLine()!.split(separator: " ").map { Int($0)! }
let R = RC[0]
let C = RC[1]
let directions = [(-1, 0), (1, 0), (0, -1), (0, 1)]

var graph: [[Character]] = []
var jihoon = (0, 0)
var fireQueue: [(y: Int, x: Int)] = []
var fireTime = Array(repeating: [Int](repeating: Int.max, count: C), count: R)

for i in 0..<R {
    let line = readLine()!.map { $0 }
    
    for (j, char) in line.enumerated() {
        if char == "J" { jihoon = (i, j) }
        if char == "F" {
            fireQueue.append((i, j))
            fireTime[i][j] = 0
        }
    }
    
    graph.append(line)
}

func bfsFire() {
    var queue = fireQueue.map { ($0.y, $0.x, 0) }
    var head = 0
    
    while head < queue.count {
        let (y, x, time) = queue[head]
        head += 1
        
        for direction in directions {
            let nextX = x + direction.1
            let nextY = y + direction.0
            
            guard (0..<C) ~= nextX && (0..<R) ~= nextY else { continue }
            if graph[nextY][nextX] == "#" { continue }
            if fireTime[nextY][nextX] <= time + 1 { continue }
            fireTime[nextY][nextX] = time + 1
            
            queue.append((nextY, nextX, time + 1))
        }
    }
    
}

func bfsEscape(y: Int, x: Int) -> String {
    var visited = Array(repeating: [Bool](repeating: false, count: C), count: R)
    var queue: [(y: Int, x: Int, distance: Int)] = [(y, x, 0)]
    var head = 0
    visited[y][x] = true
    
    while head < queue.count {
        let (y, x, time) = queue[head]
        head += 1
        
        for direction in directions {
            let nextX = x + direction.1
            let nextY = y + direction.0
            
            guard (0..<C) ~= nextX && (0..<R) ~= nextY else { return String(time+1) }
            if graph[nextY][nextX] == "#" { continue }
            if visited[nextY][nextX] { continue }
            
            if fireTime[nextY][nextX] <= time + 1 { continue }
            
            visited[nextY][nextX] = true
            
            queue.append((nextY, nextX, time + 1))
        }
        
    }
    
    return "IMPOSSIBLE"
}

bfsFire()

print(bfsEscape(y: jihoon.0, x: jihoon.1))
