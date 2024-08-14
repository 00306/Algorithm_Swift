//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 9/2/24.
//

let n = Int(readLine()!)!
let parents = readLine()!.split(separator: " ").map { Int($0)! }
let removeNode = Int(readLine()!)!
var graph: [Int: [Int]] = [:]
var result = 0

for i in 0..<n {
    graph[parents[i], default: []].append(i)
}

func dfs(startNode: Int) {
    guard let childNodes = graph[startNode] else {
        result += 1
        return
    }
    
    for node in childNodes {
        if node == removeNode {
            if childNodes.count == 1 { result += 1 }
            continue
        }
        
        dfs(startNode: node)
    }
}

dfs(startNode: -1)
print(removeNode == graph[-1]!.first! ? 0 : result)
