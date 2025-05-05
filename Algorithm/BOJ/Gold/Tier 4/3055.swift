//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 5/5/25.
//

let RC = readLine()!.split(separator: " ").map { Int($0)! }
let R = RC[0]
let C = RC[1]
let directions = [(0, 1), (0, -1), (1, 0), (-1, 0)]

var graph = Array(repeating: [Character](repeating: Character(" "), count: C), count: R)
var start: (x: Int, y: Int, time: Int) = (0, 0, 0)

for column in 0..<R {
    let line = readLine()!
    
    for (row, character) in line.enumerated() {
        if character == "S" { start = (x: row, y: column, time: 0) }
        graph[column][row] = character
    }
}

func waterRise(graph: inout [[Character]], column: Int, row: Int) {
    var waterCoordinate: [(x: Int, y: Int)] = []
    
    for i in 0..<column {
        for j in 0..<row where graph[i][j] == "*" {
            waterCoordinate.append((j, i))
        }
    }
    
    for coordinate in waterCoordinate {
        for direction in directions {
            let nextX = coordinate.x + direction.1
            let nextY = coordinate.y + direction.0
            
            if nextX < 0 || nextX >= row || nextY < 0 || nextY >= column { continue }
            if graph[nextY][nextX] == "X" || graph[nextY][nextX] == "*" || graph[nextY][nextX] == "D" { continue }
            
            graph[nextY][nextX] = "*"
        }
    }
}

func findMinTime(graph: inout [[Character]], start: (x: Int, y: Int, time: Int)) -> Int {
    var visited = Array(repeating: [Bool](repeating: false, count: C), count: R)
    var queue: [(x: Int, y: Int, time: Int)] = [start]
    var head = 0
    var prevTime = -1
    
    while head < queue.count {
        let node = queue[head]
        if node.time != prevTime {
            waterRise(graph: &graph, column: R, row: C)
            prevTime = node.time
        }
        head += 1
        
        for direction in directions {
            let nextX = node.x + direction.1
            let nextY = node.y + direction.0
            
            if nextX < 0 || nextX >= C || nextY < 0 || nextY >= R { continue }
            if graph[nextY][nextX] == "D" { return node.time + 1 }
            if visited[nextY][nextX] { continue }
            visited[nextY][nextX] = true
            
            if graph[nextY][nextX] != "." { continue }
            
            queue.append((nextX, nextY, node.time + 1))
        }
        
    }
    
    return -1
}

let result = findMinTime(graph: &graph, start: start)
print(result == -1 ? "KAKTUS" : result)
