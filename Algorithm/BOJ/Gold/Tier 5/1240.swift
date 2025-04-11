//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/11/25.
//

let NM = readLine()!.split(separator: " ").map { Int($0)! }
let N = NM[0]
let M = NM[1]

var visited = Array(repeating: false, count: N+1)
var graph: [Int: [(node: Int, distance: Int)]] = [:]

for _ in 0..<N-1 {
    let connect = readLine()!.split(separator: " ").map { Int($0)! }
    let startNode = connect[0]
    let endNode = connect[1]
    let distance = connect[2]
    
    graph[startNode, default: []].append((endNode, distance))
    graph[endNode, default: []].append((startNode, distance))
}

var result: [Int] = []


func findDistanceBetween(_ current: Int, to end: Int, distance: Int) {
    if current == end {
        result.append(distance)
        return
    }
    
    visited[current] = true
    
    for next in graph[current]! {
        if visited[next.node] { continue }
        findDistanceBetween(next.node, to: end, distance: distance + next.distance)
    }
}

for _ in 0..<M {
    let nodes = readLine()!.split(separator: " ").map { Int($0)! }
    let startNode = nodes[0]
    let endNode = nodes[1]
    
    findDistanceBetween(startNode, to: endNode, distance: 0)
    visited = Array(repeating: false, count: N+1)
}

result.forEach { print($0) }
