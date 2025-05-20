//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 5/20/25.
//

let NM = readLine()!.split(separator: " ").map { Int($0)! }
let N = NM[0]
let M = NM[1]
var graph: [Int: [(end: Int, weight: Int)]] = [:]
var maxWeight = 0

for _ in 0..<M {
    let connection = readLine()!.split(separator: " ").map { Int($0)! }
    let start = connection[0]
    let end = connection[1]
    let weight = connection[2]
    
    maxWeight = max(maxWeight, weight)
    graph[start, default: []].append((end, weight))
    graph[end, default: []].append((start, weight))
}
var factories = readLine()!.split(separator: " ").map { Int($0)! }
let firstFactory = factories[0]
let secondFactory = factories[1]

var start = 1
var end = maxWeight
var result = Int.min

while start <= end {
    let mid = (start + end) / 2
    
    if bfs(start: firstFactory, end: secondFactory, currentWeight: mid) {
        result = max(result, mid)
        start = mid + 1
    } else {
        end = mid - 1
    }
}

print(result)

func bfs(start: Int, end: Int, currentWeight: Int) -> Bool {
    var visited = Array(repeating: false, count: N+1)
    var queue = [start]
    var head = 0
    visited[start] = true
    
    while head < queue.count {
        let node = queue[head]
        head += 1
        
        if end == node { return true }
        guard let connections = graph[node] else { continue }
        
        for connection in connections {
            let nextNode = connection.end
            let weight = connection.weight
            if currentWeight > weight { continue }
            if visited[nextNode] { continue }
            visited[nextNode] = true
            queue.append(nextNode)
        }
    }
    
    return false
}
