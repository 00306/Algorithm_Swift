//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 5/19/25.
//

let directions = [(-1, 0), (1, 0), (0, -1), (0, 1)]

var map: [[Character]] = []
var time = 0

for _ in 0..<12 {
    let line = readLine()!.map { $0 }
    map.append(line)
}

func bfs(map: [[Character]], y: Int, x: Int, color: Character, visited: inout [[Bool]]) -> [(y: Int, x: Int)] {
    var queue: [(y: Int, x: Int)] = [(y, x)]
    var head = 0
    visited[y][x] = true
    
    while head < queue.count {
        let (y, x) = queue[head]
        head += 1
        
        for direction in directions {
            let nextX = x + direction.1
            let nextY = y + direction.0
            
            guard (0..<12) ~= nextY && (0..<6) ~= nextX else { continue }
            if map[nextY][nextX] != color { continue }
            if visited[nextY][nextX] { continue }

            visited[nextY][nextX] = true
            queue.append((nextY, nextX))
        }
    }
    
    return queue.count >= 4 ? queue : []
}

func applyGravity(map: inout [[Character]]) {
    for i in stride(from: 11, through: 0, by: -1) {
        for j in 0..<6 {
            if map[i][j] == "." { continue }
            fall(y: i, x: j)
        }
    }
    
    func fall(y: Int, x: Int) {
        let color = map[y][x]
        var currentY = y
        
        while true {
            if currentY == 11 { break }
            if map[currentY+1][x] != "." { break }
            map[currentY][x] = "."
            map[currentY+1][x] = color
            currentY += 1
        }
    }
}

while true {
    var explodes: [(y: Int, x: Int)] = []
    var visited = Array(repeating: [Bool](repeating: false, count: 6), count: 12)
    
    for i in 0..<12 {
        for j in 0..<6 where map[i][j] != "." {
            if visited[i][j] { continue }
            let color = map[i][j]
            explodes += bfs(map: map, y: i, x: j, color: color, visited: &visited)
        }
    }
    
    if explodes.isEmpty { break }
    for (y, x) in explodes {
        map[y][x] = "."
    }
    
    applyGravity(map: &map)
    time += 1
    
}

print(time)
