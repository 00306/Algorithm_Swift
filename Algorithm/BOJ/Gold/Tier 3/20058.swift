//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/17/25.
//

let NQ = readLine()!.split(separator: " ").map { Int($0)! }
let N = NQ[0]
let Q = NQ[1]

let size = 1 << N
let directions = [(0, 1), (0, -1), (1, 0), (-1, 0)]

var graph: [[Int]] = []
var visited = Array(repeating: [Bool](repeating: false, count: size), count: size)
var sum = 0

var islandSize = 0
var islandMaxSize = 0

for _ in 0..<size {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    graph.append(line)
    
}

func firestorm(level: Int) {
    let gridSize = 1 << level
    
    for y in stride(from: 0, to: size, by: gridSize) {
        for x in stride(from: 0, to: size, by: gridSize) {
            var rows: [[Int]] = []
            
            for i in 0..<gridSize {
                var row: [Int] = []
                for j in 0..<gridSize {
                    row.append(graph[y+j][x+i])
                }
                
                rows.append(row)
            }
            
            for i in 0..<gridSize {
                for j in 0..<gridSize {
                    graph[y+i][x+j] = rows[i][gridSize-j-1]
                }
            }
        }
    }
}

func melt(size: Int) -> [[Int]] {
    var newGraph = Array(repeating: [Int](repeating: 0, count: size), count: size)
    
    for i in 0..<size {
        for j in 0..<size where graph[i][j] != 0 {
            var count = 0
            
            for direction in directions {
                let nextX = j + direction.1
                let nextY = i + direction.0
                if nextX < 0 || nextX >= size || nextY < 0 || nextY >= size { continue }
                if graph[nextY][nextX] != 0 { count += 1 }
            }
            
            if count < 3 {
                newGraph[i][j] = graph[i][j] - 1
            } else { newGraph[i][j] = graph[i][j] }
        }
    }
    
    return newGraph
}

func dfs(graph: [[Int]], x: Int, y: Int) {
    if x < 0 || x >= size || y < 0 || y >= size { return }
    if visited[y][x] { return }
    visited[y][x] = true
    if graph[y][x] == 0 { return }
    
    islandSize += 1
    sum += graph[y][x]
    
    for direction in directions {
        dfs(graph: graph, x: x + direction.1, y: y + direction.0)
    }
    
}

let L = readLine()!.split(separator: " ").map { Int($0)! }

for level in L {
    firestorm(level: level)
    graph = melt(size: size)
}

for i in 0..<size {
    for j in 0..<size where graph[i][j] != 0 {
        if visited[i][j] { continue }
        dfs(graph: graph, x: j, y: i)
        islandMaxSize = max(islandMaxSize, islandSize)
        islandSize = 0
    }
}

print(sum)
print(islandMaxSize)
