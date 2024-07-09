//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 7/9/24.
//

let boxSize = readLine()!.split(separator: " ").map { Int($0)! }
let m = boxSize[0]
let n = boxSize[1]
var tomatos = [[Int]]()
var startIndexes: [(Int, Int)] = []
var rowCount = 0
let directions: [(Int, Int)] = [(0, 1), (0, -1), (-1, 0), (1, 0)]

for _ in 0..<n {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    tomatos.append(line)
}

for i in 0..<n {
    for j in 0..<m {
        if tomatos[i][j] == 1 {
            startIndexes.append((i, j))
        } else if tomatos[i][j] == 0 {
            rowCount += 1
        }
    }
}

func bfs(graph: inout [[Int]], startIndexes: [(Int, Int)]) -> Int {
    var needVisitQueue: [(Int, Int)] = startIndexes
    var visitedQueue = Array(repeating: Array(repeating: false, count: m), count: n)
    var day = -2
    var count = -startIndexes.count
    
    var index = 0
    
    while index < needVisitQueue.count {
        day += 1
        let currentLevelCount = needVisitQueue.count - index
        for _ in 0..<currentLevelCount {
            let (y, x) = needVisitQueue[index]
            index += 1
            if y >= n || y < 0 || x >= m || x < 0 || visitedQueue[y][x] || graph[y][x] == -1 { continue }
            visitedQueue[y][x] = true
            graph[y][x] = 1
            count += 1
            
            for direction in directions {
                let nx = x + direction.1
                let ny = y + direction.0
                needVisitQueue.append((ny, nx))
            }
        }
    }
    
    return rowCount == count ? day : -1
}

print(bfs(graph: &tomatos, startIndexes: startIndexes))
