//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/9/26.
//

let input = readLine()!.split(separator: " ").map { Int($0)! }
let N = input[0]
let S = input[1]
let D = input[2]

var graph: [Int: [Int]] = [:]

for _ in 0..<N-1 {
    let connection = readLine()!.split(separator: " ").map { Int($0)! }
    graph[connection[0], default: []].append(connection[1])
    graph[connection[1], default: []].append(connection[0])
}

var count = 0

func dfs(node: Int, parent: Int) -> Int {
    var maxHeight = 0
    
    for child in graph[node, default: []] {
        if child == parent { continue }
        let childHeight = dfs(node: child, parent: node)
        
        if childHeight >= D { count += 1 }
        maxHeight = max(maxHeight, childHeight + 1)
    }
    
    return maxHeight
}

dfs(node: S, parent: 0)

print(count * 2)
