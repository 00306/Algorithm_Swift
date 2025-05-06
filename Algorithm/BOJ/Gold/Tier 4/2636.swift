//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 5/6/25.
//

let NM = readLine()!.split(separator: " ").map { Int($0)! }
let N = NM[0]
let M = NM[1]
let directions = [(0, 1), (0, -1), (1, 0), (-1, 0)]

var graph: [[Int]] = []

var cheezeCount = 0

for _ in 0..<N {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    
    cheezeCount += line.filter { $0 == 1 }.count
    
    graph.append(line)
}

func findAirArea() -> [[Int]] {
    var airArea = Array(repeating: [Int](repeating: 0, count: M), count: N)
    var visited = Array(repeating: [Bool](repeating: false, count: M), count: N)
    var queue = [(0, 0)]
    var head = 0
    
    while head < queue.count {
        let current = queue[head]
        head += 1
        
        for direction in directions {
            let nextX = current.1 + direction.1
            let nextY = current.0 + direction.0
            
            if nextX < 0 || nextX >= M || nextY < 0 || nextY >= N { continue }
            if graph[nextY][nextX] == 1 { continue }
            if visited[nextY][nextX] { continue }
            visited[nextY][nextX] = true
            
            airArea[nextY][nextX] = 2
            queue.append((nextY, nextX))
            
        }
    }
    
    return airArea
}

var time = 0
var prevCheezeCount = cheezeCount

while cheezeCount > 0 {
    let airArea = findAirArea()
    time += 1
    prevCheezeCount = cheezeCount
    
    for i in 0..<N {
        for j in 0..<M where graph[i][j] == 1 {
            for direction in directions {
                let nextX = j + direction.1
                let nextY = i + direction.0
                
                if nextX < 0 || nextX >= M || nextY < 0 || nextY >= N { continue }
                if airArea[nextY][nextX] == 2 {
                    graph[i][j] = 0
                    cheezeCount -= 1
                    break
                }
            }
        }
    }
    
    
}

print(time, prevCheezeCount)
