//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/15/25.
//

var result = ""
var testCase = 0

while true {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    let n = input[0]
    let m = input[1]
    
    if n == 0, m == 0 { break }
    testCase += 1
    
    let graph = buildGraph(nodeCount: n, edgeCount: m)
    var visited = Array(repeating: false, count: n + 1)
    var treeCount = 0
    
    for node in 1...n {
        if visited[node] { continue }
        let hasCycle = dfs(graph, &visited, parent: node, current: node)
        if !hasCycle {
            treeCount += 1
        }
    }
    
    result += makeResultMessage(testCase: testCase, treeCount: treeCount)
}

print(result)


func buildGraph(nodeCount: Int, edgeCount: Int) -> [[Int]] {
    var graph = Array(repeating: [Int](), count: nodeCount + 1)
    
    for _ in 0..<edgeCount {
        let edge = readLine()!.split(separator: " ").compactMap { Int($0) }
        let u = edge[0], v = edge[1]
        graph[u].append(v)
        graph[v].append(u)
    }
    
    return graph
}

func dfs(_ graph: [[Int]], _ visited: inout [Bool], parent: Int, current: Int) -> Bool {
    visited[current] = true
    for neighbor in graph[current] {
        if neighbor == parent { continue }
        if visited[neighbor] {
            return true
        }
        if dfs(graph, &visited, parent: current, current: neighbor) {
            return true
        }
    }
    return false
}

func makeResultMessage(testCase: Int, treeCount: Int) -> String {
    switch treeCount {
        case 0:
            return "Case \(testCase): No trees.\n"
        case 1:
            return "Case \(testCase): There is one tree.\n"
        default:
            return "Case \(testCase): A forest of \(treeCount) trees.\n"
    }
}
