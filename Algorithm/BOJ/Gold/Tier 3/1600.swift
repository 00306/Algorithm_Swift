//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 5/13/25.
//

let K = Int(readLine()!)!
let WH = readLine()!.split(separator: " ").map { Int($0)! }
let W = WH[0]
let H = WH[1]
let directions: [(y: Int, x: Int)] = [(-1, 0), (1, 0), (0, -1), (0, 1)]
let knightMoves: [(y: Int, x: Int)] = [(-2, -1), (-2, 1), (-1, 2), (1, 2), (2, -1), (2, 1), (-1, -2), (1, -2)]


var graph: [[Int]] = []

for _ in 0..<H {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    graph.append(line)
}

func bfs(y: Int, x: Int) -> Int {
    var queue = [(y, x, K, 0)]
    var visited = Array(repeating: Array(repeating: [Int](repeating: Int.max, count: W), count: H), count: K+1)
    var head = 0
    visited[K][y][x] = 0
    
    while head < queue.count {
        let (y, x, k, time) = queue[head]
        head += 1
        
        if y == H-1, x == W-1 { return time }
        
        if k > 0 {
            for move in knightMoves {
                let nextX = x + move.x
                let nextY = y + move.y
                
                guard (0..<W) ~= nextX && (0..<H) ~= nextY else { continue }
                if graph[nextY][nextX] == 1 { continue }
                if visited[k-1][nextY][nextX] <= time + 1 { continue }
                visited[k-1][nextY][nextX] = time + 1
                
                queue.append((nextY, nextX, k-1, time+1))
            }
        }
        
        for direction in directions {
            let nextX = x + direction.x
            let nextY = y + direction.y
            
            guard (0..<W) ~= nextX && (0..<H) ~= nextY else { continue }
            if graph[nextY][nextX] == 1 { continue }
            if visited[k][nextY][nextX] <= time + 1 { continue }
            visited[k][nextY][nextX] = time + 1
            
            queue.append((nextY, nextX, k, time+1))
        }
    }
    
    return -1
}

print(bfs(y: 0, x: 0))
