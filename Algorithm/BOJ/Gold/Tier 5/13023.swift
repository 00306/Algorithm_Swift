//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/5/25.
//

let NM = readLine()!.split(separator: " ").map { Int($0)! }
let N = NM[0]
let M = NM[1]

var graph: [[Int]] = Array(repeating: [], count: N)
var visited = Array(repeating: false, count: N)
var isExist = false

for _ in 0..<M {
    let edge = readLine()!.split(separator: " ").map { Int($0)! }
    graph[edge[0]].append(edge[1])
    graph[edge[1]].append(edge[0])
}

func dfs(depth: Int, node: Int) {
    visited[node] = true
    if depth == 5 {
        isExist = true
        return
    }
    
    for neighbor in graph[node] {
        if visited[neighbor] { continue }
        dfs(depth: depth + 1, node: neighbor)
    }
    
    visited[node] = false
}

for i in 0..<N {
    dfs(depth: 1, node: i)
}

print(isExist ? 1 : 0)


