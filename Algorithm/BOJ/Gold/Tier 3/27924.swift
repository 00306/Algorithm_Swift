//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/13/26.
//

let N = Int(readLine()!)!

var graph: [Int: [Int]] = [:]

for _ in 0..<N-1 {
    let connect = readLine()!.split(separator: " ").map { Int($0)! }
    let firstNode = connect[0]
    let secondNode = connect[1]
    
    graph[firstNode, default: []].append(secondNode)
    graph[secondNode, default: []].append(firstNode)
}

let positions = readLine()!.split(separator: " ").map { Int($0)! }
let a = positions[0]
let b = positions[1]
let c = positions[2]

func bfs(from start: Int) -> [Int] {
    var dist = [Int](repeating: -1, count: N + 1)
    dist[start] = 0
    var queue = [start]
    var idx = 0
    
    while idx < queue.count {
        let cur = queue[idx]
        idx += 1
        for next in graph[cur, default: []] {
            if dist[next] != -1 { continue }
            dist[next] = dist[cur] + 1
            queue.append(next)
        }
    }
    return dist
}

let distA = bfs(from: a)
let distB = bfs(from: b)
let distC = bfs(from: c)

let leafs = graph.filter { $0.value.count == 1 }.keys
var result = "NO"

for leaf in leafs {
    if distA[leaf] < distB[leaf], distA[leaf] < distC[leaf] {
        result = "YES"
        break
    }
}

print(result)


