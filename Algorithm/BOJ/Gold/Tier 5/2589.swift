//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 5/7/25.
//

let NM = readLine()!.split(separator: " ").map { Int($0)! }
let N = NM[0]
let M = NM[1]
let directions = [(0, 1), (0, -1), (1, 0), (-1, 0)]

var graph: [[Character]] = []

var result = 0

for _ in 0..<N {
    let line = readLine()!.map { $0 }
    graph.append(line)
}

func bfs(start: (y: Int, x: Int, distance: Int), visited: inout [[Bool]]) {
    var queue = [start]
    var head = 0
    
    while head < queue.count {
        let current = queue[head]
        head += 1
        
        for direction in directions {
            let nextX = current.x + direction.1
            let nextY = current.y + direction.0
            
            if nextX < 0 || nextX >= M || nextY < 0 || nextY >= N { continue }
            if graph[nextY][nextX] == "W" { continue }
            if visited[nextY][nextX] { continue }
            visited[nextY][nextX] = true
            
            queue.append((nextY, nextX, current.distance + 1))
        }
        
        result = max(result, current.distance)
    }
}


for i in 0..<N {
    for j in 0..<M where graph[i][j] == "L" {
        var visited = Array(repeating: [Bool](repeating: false, count: M), count: N)
        visited[i][j] = true
        bfs(start: (i, j, 0), visited: &visited)
    }
}

print(result)
