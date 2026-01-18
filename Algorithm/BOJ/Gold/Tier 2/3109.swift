//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 1/19/26.
//

let RC = readLine()!.split(separator: " ").map { Int($0)! }
let R = RC[0]
let C = RC[1]

var graph: [[Character]] = []

for _ in 0..<R {
    let row = Array(readLine()!)
    graph.append(row)
}


var visited = Array(repeating: [Bool](repeating: false, count: C), count: R)
var result = 0

func dfs(i: Int, j: Int) -> Bool {
    if visited[i][j] { return false }
    visited[i][j] = true
    
    if j == C-1 { return true }
    
    if i-1 >= 0, j+1 < C, !visited[i-1][j+1], graph[i-1][j+1] != "x" {
        if dfs(i: i-1, j: j+1) { return true }
    }
    
    if j+1 < C, !visited[i][j+1], graph[i][j+1] != "x" {
        if dfs(i: i, j: j+1) { return true }
    }
    
    if i+1 < R, j+1 < C, !visited[i+1][j+1], graph[i+1][j+1] != "x" {
        if dfs(i: i+1, j: j+1) { return true }
    }
    
    return false
}


for i in 0..<R {
    if dfs(i: i, j: 0) {
        result += 1
    }
}


print(result)
