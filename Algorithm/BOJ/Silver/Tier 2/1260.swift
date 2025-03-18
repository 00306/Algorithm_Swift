//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 6/27/24.
//

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let m = input[1]
let v = input[2]
var graph: [Int: [Int]] = [:]
var visited = Array(repeating: false, count: n+1)
var visitedNum: [Int] = []

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    graph[input[0], default: []].append(input[1])
    graph[input[1], default: []].append(input[0])
}

for (key, value) in graph {
    graph[key] = value.sorted()
}



dfs(start: v)


func dfs(start: Int) {
    visited[start] = true
    visitedNum.append(start)
    
    for element in graph[start] ?? [] {
        if !visited[element] {
            dfs(start: element)
        }
    }
}

func bfs(graph: [Int: [Int]], start: Int) -> [Int] {
    var visitedQueue: [Int] = []
    var needVisitQueue: [Int] = [start]
    
    while !needVisitQueue.isEmpty {
        let needVisitNode = needVisitQueue.removeFirst()
        
        if !visitedQueue.contains(needVisitNode) {
            visitedQueue.append(needVisitNode)
            needVisitQueue += graph[needVisitNode] ?? []
        }
    }
    
    return visitedQueue
}

visitedNum.forEach { print($0, terminator: " ") }
print()
bfs(graph: graph, start: v).forEach { print($0, terminator: " ")}
