//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/4/25.
//

func solution() -> String {
    let ve = readLine()!.split(separator: " ").map { Int($0)! }
    let v = ve[0]
    let e = ve[1]
    var graph: [Int: [Int]] = [:]
    var colors = Array(repeating: 0, count: v + 1)
    var isBipartite = true
    
    for _ in 0..<e {
        let uv = readLine()!.split(separator: " ").map { Int($0)! }
        let u = uv[0]
        let v = uv[1]
        graph[u, default: []].append(v)
        graph[v, default: []].append(u)
    }
    
    func dfs(node: Int, color: Int) {
        colors[node] = color
        
        for neighbor in graph[node, default: []] {
            if colors[neighbor] == 0 {
                dfs(node: neighbor, color: -color)
            } else if colors[neighbor] == color {
                isBipartite = false
            }
        }
    }
    
    for node in 1...v {
        if colors[node] == 0 {
            dfs(node: node, color: 1)
        }
    }
    
    return isBipartite ? "YES" : "NO"
}

let k = Int(readLine()!)!
var result = ""
for _ in 0..<k {
    result += "\(solution())\n"
}

print(result)


