//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 6/29/24.
//

let input = readLine()!.split(separator: " ").map { Int($0)! }
let m = input[0]
let n = input[1]
var rooms: [[Int]] = []
var visited = Array(repeating: Array(repeating: false, count: m), count: n)
var needVisitQueue: [(Int, Int, Int)] = [(0, 0, 0)]
visited[0][0] = true

let move: [(Int, Int)] = [(0, 1), (0, -1), (-1, 0), (1, 0)]

for _ in 0..<n {
    let line = readLine()!.map { Int(String($0))! }
    rooms.append(line)
}

while !needVisitQueue.isEmpty {
    let currentCoordinate = needVisitQueue.removeFirst()
    
    let y = currentCoordinate.0
    let x = currentCoordinate.1
    let wallBreakCount = currentCoordinate.2
    
    if y == n-1, x == m-1 {
        print(wallBreakCount)
        break
    }
    
    for i in 0..<4 {
        let nextY = y + move[i].0
        let nextX = x + move[i].1
        
        if nextY < 0 || nextY >= n || nextX < 0 || nextX >= m { continue }
        if visited[nextY][nextX] { continue }
        
        if rooms[nextY][nextX] == 0 {
            needVisitQueue.insert((nextY, nextX, wallBreakCount), at: 0)
        } else {
            needVisitQueue.append((nextY, nextX, wallBreakCount + 1))
        }
        visited[nextY][nextX] = true
    }
}

