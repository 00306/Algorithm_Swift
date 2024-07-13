//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 7/14/24.
//

let n = Int(readLine()!)!
var visited = Array(repeating: Array(repeating: false, count: n), count: n)
var graph = [[Int]]()
var maxValue = Int.min
var count = 0

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    graph.append(input)
}

func dfs(x: Int, y: Int, level: Int) {
    if x >= n || x < 0 || y >= n || y < 0 || visited[y][x] || graph[y][x] <= level { return }
    visited[y][x] = true
    
    dfs(x: x+1, y: y, level: level)
    dfs(x: x-1, y: y, level: level)
    dfs(x: x, y: y-1, level: level)
    dfs(x: x, y: y+1, level: level)
}

for level in 0...100 {
    for i in 0..<n {
        for j in 0..<n {
            if !visited[i][j] && graph[i][j] > level {
                dfs(x: j, y: i, level: level)
                count += 1
            }
        }
    }
    maxValue = max(maxValue, count)
    count = 0
    visited = Array(repeating: Array(repeating: false, count: n), count: n)
}

print(maxValue)
