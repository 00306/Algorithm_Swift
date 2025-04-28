//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/28/25.
//

let V = Int(readLine()!)!
var graph: [Int: [(vertex: Int, edge: Int)]] = [:]

for _ in 0..<V {
    let connections = readLine()!.split(separator: " ").map { Int($0)! }
    let parent = connections[0]
    var i = 1
    
    while connections[i] != -1 {
        let node = connections[i]
        let edge = connections[i+1]
       
        graph[parent, default: []].append((node, edge))
        
        i += 2
    }
}

func findTreesDiameter(currentNode: Int) -> Int {
    var furthestNode = 0
    var diameter = 0
    var visited = Array(repeating: false, count: V+1)
    
    func dfs(currentNode: Int, distance: Int) {
        visited[currentNode] = true
        
        for nodes in graph[currentNode]! {
            if visited[nodes.vertex] { continue }
            dfs(currentNode: nodes.vertex, distance: distance + nodes.edge)
        }
        
        if distance > diameter {
            furthestNode = currentNode
            diameter = distance
        }
        
        visited[currentNode] = false
    }
    
    dfs(currentNode: 1, distance: 0)
    diameter = 0
    dfs(currentNode: furthestNode, distance: 0)
    
    
    return diameter
}

print(findTreesDiameter(currentNode: 1))

