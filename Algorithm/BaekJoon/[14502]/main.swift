//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 8/24/24.
//

let NM = readLine()!.split(separator: " ").map { Int($0)! }
let n = NM[0]
let m = NM[1]
var map: [[Int]] = []
var blankCoordinates: [(Int, Int)] = []
var virusCoordinates: [(Int, Int)] = []
var result = Int.min
var wallCombinations: [[(Int, Int)]] = []
let directions = [(0, 1), (0, -1), (-1, 0), (1, 0)]

for _ in 0..<n {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    map.append(line)
}


for i in 0..<n {
    for j in 0..<m {
        if map[i][j] == 0 {
            blankCoordinates.append((i, j))
        } else if map[i][j] == 2 {
            virusCoordinates.append((i, j))
        }
    }
}

for i in 0..<blankCoordinates.count - 2 {
    for j in i+1..<blankCoordinates.count - 1 {
        for k in j+1..<blankCoordinates.count {
            wallCombinations.append([blankCoordinates[i], blankCoordinates[j], blankCoordinates[k]])
        }
    }
}

for wallCombination in wallCombinations {
    for coordinate in wallCombination {
        map[coordinate.0][coordinate.1] = 1
    }
    
    bfs(start: virusCoordinates)
    
    for blankCoordinate in blankCoordinates {
        map[blankCoordinate.0][blankCoordinate.1] = 0
    }
    
}

func bfs(start: [(Int, Int)]) {
    var needVisitQueue: [(Int, Int)] = start
    var visited = Array(repeating: Array(repeating: false, count: m), count: n)
    var safeZone = 0
    
    while !needVisitQueue.isEmpty {
        let currentCoordinate = needVisitQueue.removeFirst()
        visited[currentCoordinate.0][currentCoordinate.1] = true
        
        for direction in directions {
            let nextY = currentCoordinate.0 + direction.0
            let nextX = currentCoordinate.1 + direction.1
            
            if nextY < 0 || nextY >= n || nextX < 0 || nextX >= m || map[nextY][nextX] == 1 || map[nextY][nextX] == 2 || visited[nextY][nextX] { continue }
            map[nextY][nextX] = 2
            needVisitQueue.append((nextY, nextX))
            
        }
    }
    
    for i in 0..<n {
        for j in 0..<m {
            if map[i][j] == 0 { safeZone += 1 }
        }
    }
    
    result = max(result, safeZone)
}

print(result)
