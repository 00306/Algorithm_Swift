//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 8/27/24.
//

let NM = readLine()!.split(separator: " ").map { Int($0)! }
let n = NM[0]
let m = NM[1]
let directions = [(-1, 0), (1, 0), (0, 1), (0, -1)]
var map: [[Int]] = []
var visited = Array(repeating: Array(repeating: false, count: m-1), count: n-1)
var count = 0
var year = 0

for _ in 0..<n {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    map.append(line)
}

func figureLevel(map: [[Int]]) -> [[Int]] {
    var levelFigures = Array(repeating: Array(repeating: 0, count: m), count: n)
    
    for i in 1..<n-1 {
        for j in 1..<m-1 {
            if map[i][j] == 0 { continue }
            
            for direction in directions {
                if map[i + direction.0][j + direction.1] == 0 { levelFigures[i][j] -= 1 }
            }
        }
    }
    
    return levelFigures
}

func dfs(x: Int, y: Int) {
    visited[y][x] = true
    
    for direction in directions {
        let nextX = x + direction.1
        let nextY = y + direction.0
        
        if nextX < 1 || nextX >= m-1 || nextY < 1 || nextY >= n-1 || visited[nextY][nextX] || map[nextY][nextX] == 0 { continue }
        dfs(x: nextX, y: nextY)
    }
}

while !(count >= 2) {
    visited = Array(repeating: Array(repeating: false, count: m-1), count: n-1)
    count = 0
    let levelFigure = figureLevel(map: map)
    year += 1
    
    for i in 1..<n-1 {
        for j in 1..<m-1 {
            map[i][j] = max(0, map[i][j] + levelFigure[i][j])
        }
    }
    
    if map.flatMap { $0 }.allSatisfy { $0 == 0 } {
        year = 0
        break
    }
    
    for i in 1..<n-1 {
        for j in 1..<m-1 {
            if map[i][j] == 0 || visited[i][j] { continue }
            dfs(x: j, y: i)
            count += 1
        }
    }
}

print(year)
