//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 7/2/24.
//

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let m = input[1]
var visited = Array(repeating: Array(repeating: false, count: m), count: n)
var needVisitQueue = [(Int, Int, Int)]()
var result = 10

var graph: [[Int]] = []

for _ in 0..<n {
    let line = readLine()!.map { Int(String($0))! }
    
    graph.append(line)
}

needVisitQueue.append((0, 0, 0))

while !needVisitQueue.isEmpty {
    let node = needVisitQueue.removeFirst()
    let x = node.1
    let y = node.0
    let count = node.2
    
    if x == m-1, y == n-1 {
        result = count
        break
    }
    
    if x < 0 || x >= m || y < 0 || y >= n || graph[y][x] == 0 || visited[y][x] { continue }
    visited[y][x] = true
    needVisitQueue.append(contentsOf: [(node.0, node.1 + 1, node.2 + 1), (node.0, node.1 - 1, node.2 + 1), (node.0 - 1, node.1, node.2 + 1), (node.0 + 1, node.1, node.2 + 1) ])
    
}

print(result + 1)
