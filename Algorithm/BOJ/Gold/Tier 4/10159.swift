//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/16/25.
//

let n = Int(readLine()!)!
let m = Int(readLine()!)!

var heavierGraph = Array(repeating: [Int](), count: n+1)
var lighterGraph = Array(repeating: [Int](), count: n+1)
var visited = Array(repeating: false, count: n+1)

var result = ""

for _ in 0..<m {
    let comparison = readLine()!.split(separator: " ").map { Int($0)! }
    let heavier = comparison[0]
    let lighter = comparison[1]
    
    heavierGraph[lighter].append(heavier)
    lighterGraph[heavier].append(lighter)
}

func dfs(graph: [[Int]], currentNode: Int) -> Int {
    var count = 1
    visited[currentNode] = true
    
    for child in graph[currentNode] {
        if visited[child] { continue }
        count += dfs(graph: graph, currentNode: child)
    }
    
    return count
}

for i in 1...n {
    let heavierCount = dfs(graph: heavierGraph, currentNode: i)
    let lighterCount = dfs(graph: lighterGraph, currentNode: i)
    let connectedNodeCount = heavierCount + lighterCount - 1
    
    result += "\(n - connectedNodeCount)\n"
    visited = Array(repeating: false, count: n+1)
}

print(result)
