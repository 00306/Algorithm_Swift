//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 7/1/24.
//
import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let m = input[1]

if m == 0 {
    print(n)
    exit(0)
}

var graph: [Int: [Int]] = [:]

var count = 0

for _ in 0..<m {
    let vertexs = readLine()!.split(separator: " ").map { Int($0)! }
    graph[vertexs[0], default: []].append(vertexs[1])
    graph[vertexs[1], default: []].append(vertexs[0])
}

var visited = Array(repeating: false, count: graph.keys.max()!+1)

for key in graph.keys {
    if visited[key] { continue }
    dfs(start: key)
    count += 1
    
}

func dfs(start: Int) {
    visited[start] = true
    
    for element in graph[start]! {
        if visited[element] { continue }
        dfs(start: element)
    }
}

print(count + n - graph.keys.count)
