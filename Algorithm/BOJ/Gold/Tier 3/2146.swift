//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 5/11/25.
//

let N = Int(readLine()!)!
let directions = [(-1, 0), (1, 0), (0, -1), (0, 1)]

var map: [[Int]] = []

for _ in 0..<N {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    map.append(line)
}

var areaID = Array(repeating: [Int](repeating: -1, count: N), count: N)
var seaside: [(y: Int, x: Int, adjacentAreaID: Int)] = []
var result = Int.max
var currentAreaID = 2

func grantAreaID(y: Int, x: Int, areaMap: inout [[Int]], currentAreaID: Int) {
    var visited = Array(repeating: [Bool](repeating: false, count: N), count: N)
    var queue: [(y: Int, x: Int)] = [(y, x)]
    var head = 0
    
    while head < queue.count {
        let current = queue[head]
        head += 1
        if map[current.y][current.x] == 0 { continue }
        if visited[current.y][current.x] { continue }
        visited[current.y][current.x] = true
        areaMap[current.y][current.x] = currentAreaID
        
        for direction in directions {
            let nextX = current.x + direction.1
            let nextY = current.y + direction.0
            
            if nextX < 0 || nextX >= N || nextY < 0 || nextY >= N { continue }
            queue.append((nextY, nextX))
        }
    }
}

func searchSeaside() {
    for i in 0..<N {
        for j in 0..<N where map[i][j] == 0 {
            for direction in directions {
                let nextX = j + direction.1
                let nextY = i + direction.0
                
                if nextX < 0 || nextX >= N || nextY < 0 || nextY >= N { continue }
                
                if map[nextY][nextX] == 1 {
                    seaside.append((i, j, areaID[nextY][nextX]))
                    break
                }
            }
        }
    }
}

func searchMinDistance(x: Int, y: Int, currentAreaID: Int) -> Int {
    var visited = Array(repeating: [Bool](repeating: false, count: N), count: N)
    var queue = [(y, x, 1)]
    var head = 0
    visited[y][x] = true
    
    while head < queue.count {
        let current = queue[head]
        head += 1
        
        for direction in directions {
            let nextX = current.1 + direction.1
            let nextY = current.0 + direction.0
            
            if nextX < 0 || nextX >= N || nextY < 0 || nextY >= N { continue }
            if areaID[nextY][nextX] == currentAreaID { continue }
            if map[nextY][nextX] == 1 && areaID[nextY][nextX] != currentAreaID { return current.2 }
            if visited[nextY][nextX] { continue }
            
            visited[nextY][nextX] = true
            
            queue.append((nextY, nextX, current.2 + 1))
        }
    }
    
    return Int.max
}

for i in 0..<N {
    for j in 0..<N where map[i][j] == 1 {
        guard areaID[i][j] == -1 else { continue }
        
        grantAreaID(y: i, x: j, areaMap: &areaID, currentAreaID: currentAreaID)
        currentAreaID += 1
    }
}

searchSeaside()

for coordinate in seaside {
    let minDistance = searchMinDistance(x: coordinate.1, y: coordinate.0, currentAreaID: coordinate.adjacentAreaID)
    result = min(result, minDistance)
}

print(result == Int.max ? 0 : result)
