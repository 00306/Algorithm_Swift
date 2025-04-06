//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/6/25.
//

let NM = readLine()!.split(separator: " ").map { Int($0)! }
let N = NM[0]
let M = NM[1]
let directions = [(1, 0), (-1, 0), (0, 1), (0, -1)]

var searchSpace: [[Int]] = []
var visited = Array(repeating: Array(repeating: false, count: M), count: N)
var hour = 0

for _ in 0..<N {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    searchSpace.append(line)
}

func searchAirSpace(x: Int = 0, y: Int = 0) {
    if x < 0 || x >= M || y < 0 || y >= N { return }
    
    if visited[y][x] { return }
    visited[y][x] = true
    
    if searchSpace[y][x] == 1 { return }
    
    searchSpace[y][x] = 2
    
    for direction in directions {
        let nextX = x + direction.0
        let nextY = y + direction.1
        
        searchAirSpace(x: nextX, y: nextY)
    }
}

func searchExposedCheeze() -> [(Int, Int)] {
    var exposeCheezes: [(Int, Int)] = []
    
    for y in 1..<N-1 {
        for x in 1..<M-1 {
            var exposeCount = 0
            
            if searchSpace[y][x] == 1 {
                for direction in directions {
                    let nextX = x + direction.0
                    let nextY = y + direction.1
                    
                    if searchSpace[nextY][nextX] == 2 {
                        exposeCount += 1
                    }
                }
            }
            
            if exposeCount > 1 {
                exposeCheezes.append((y, x))
            }
        }
    }
    
    return exposeCheezes
}

while searchSpace.flatMap({ $0 }).contains(1) {
    visited = Array(repeating: Array(repeating: false, count: M), count: N)
    
    searchAirSpace()
    
    for (y, x) in searchExposedCheeze() {
        searchSpace[y][x] = 0
    }
    
    hour += 1
}

print(hour)
