//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/8/26.
//

let WH = readLine()!.split(separator: " ").map { Int($0)! }
let W = WH[0]
let H = WH[1]
let oddDirections = [(-1, 0), (-1, 1), (0, 1), (1, 1), (1, 0), (0, -1)]
let evenDirections = [(-1, -1), (-1, 0), (0, 1), (1, 0), (1, -1), (0, -1)]

var map: [[Int]] = []
var visited = Array(repeating: [Bool](repeating: false, count: W), count: H)

for _ in 0..<H {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    map.append(line)
}

func findIsland(y: Int, x: Int) {
    var needVisitQueue: [(Int, Int)] = [(y, x)]
    var isIsland = true
    var index = 0
    
    while index < needVisitQueue.count {
        let node = needVisitQueue[index]
        index += 1
        
        let directions = (node.0+1) % 2 == 0 ? evenDirections : oddDirections
        
        for direction in directions {
            let nextY = node.0 + direction.0
            let nextX = node.1 + direction.1
            if nextY < 0 || nextY >= H || nextX < 0 || nextX >= W {
                isIsland = false
                continue
            }
            
            
            if map[nextY][nextX] != 0 { continue }
            
            if visited[nextY][nextX] { continue }
            visited[nextY][nextX] = true
            
            needVisitQueue.append((nextY, nextX))
        }
    }
    
    if isIsland {
        for node in needVisitQueue {
            map[node.0][node.1] = 2
        }
    }
    
}

func calculateEdge(y: Int, x: Int) -> Int {
    var count = 0
    
    let directions = (y+1) % 2 == 0 ? evenDirections : oddDirections
    
    for direction in directions {
        let neighborY = y + direction.0
        let neighborX = x + direction.1
        
        if neighborY < 0 || neighborY >= H || neighborX < 0 || neighborX >= W {
            count += 1
            continue
        }
        
        if map[neighborY][neighborX] == 0 { count += 1 }
    }
    
    
    return count
}

for i in 0..<H {
    for j in 0..<W {
        if visited[i][j] { continue }
        visited[i][j] = true
        if map[i][j] != 0 { continue }
        findIsland(y: i, x: j)
    }
}

var result = 0

for i in 0..<H {
    for j in 0..<W {
        if map[i][j] != 1 { continue }
        result += calculateEdge(y: i, x: j)
    }
}

print(result)

