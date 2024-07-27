//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 8/21/24.
//

let RC = readLine()!.split(separator: " ").map { Int($0)! }
let r = RC[0]
let c = RC[1]
var graph: [[Int]] = []

for _ in 0..<r {
    let line = readLine()!.map { Int($0.asciiValue ?? 65) - 65 }
    graph.append(line)
}

let directions: [(Int, Int)] = [ (-1, 0), (1, 0), (0, 1), (0, -1)]
var result = Int.min

func dfs(start: (Int, Int, Int), bitmask: Int) {
    let x = start.1
    let y = start.0
    
    result = max(result, start.2)
    
    for direction in directions {
        let newX = x + direction.1
        let newY = y + direction.0
        
        if newX < 0 || newX >= c || newY < 0 || newY >= r { continue }
        
        let newBitmask = 1 << graph[newY][newX]
        
        if bitmask & newBitmask == 0 { dfs(start: (newY, newX, start.2 + 1), bitmask: bitmask | newBitmask) }
    }
}

dfs(start: (0, 0, 1), bitmask: 1 << graph[0][0])

print(result)
