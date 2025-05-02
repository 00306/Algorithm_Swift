//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 5/2/25.
//

let NM = readLine()!.split(separator: " ").map { Int($0)! }
let N = NM[0]
let M = NM[1]

let directions = [(0, 1), (0, -1), (1, 0), (-1, 0)]
var graph: [[Int]] = []

for _ in 0..<N {
    let line = readLine()!.map { Int(String($0))! }
    graph.append(line)
}

func getMinStep(from start: (x: Int, y: Int), to end: (x: Int, y: Int)) -> Int {
    var visited = Array(repeating: Array(repeating: [false, false], count: M), count: N)
    var queue: [(x: Int, y: Int, distance: Int, wallBreak: Int)] = [(start.x, start.y, distance: 1, wallBreak: 0)]
    var head = 0
    
    while head < queue.count {
        let (x, y, distance, wallBreak) = queue[head]
        head += 1
        if x == end.x && y == end.y { return distance }
        
        for direction in directions {
            let nextX = x + direction.1
            let nextY = y + direction.0
            
            if nextX < 0 || nextX >= M || nextY < 0 || nextY >= N { continue }
            
            if graph[nextY][nextX] == 0 {
                if visited[nextY][nextX][wallBreak] { continue }
                
                queue.append((nextX, nextY, distance+1, wallBreak))
                visited[nextY][nextX][wallBreak] = true
            } else if wallBreak == 0 {
                if visited[nextY][nextX][1] { continue }
                
                queue.append((nextX, nextY, distance+1, 1))
                visited[nextY][nextX][1] = true
            }
        }
    }
    
    return -1
}

print(getMinStep(from: (0, 0), to: (M-1, N-1)))
