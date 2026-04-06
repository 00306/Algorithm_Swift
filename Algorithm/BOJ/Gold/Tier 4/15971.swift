//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/6/26.
//

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
var firstRobotIndex = input[1]
var secondRobotIndex = input[2]
var result = 0

var graph: [Int: [(endNode: Int, weight: Int)]] = [:]

for _ in 0..<n-1 {
    let connect = readLine()!.split(separator: " ").map { Int($0)! }
    let startNode = connect[0]
    let endNode = connect[1]
    let weight = connect[2]
    
    graph[startNode, default: []].append((endNode, weight))
    graph[endNode, default: []].append((startNode, weight))
}

var needVisitQueue: [(Int, Int, Int)] = [(firstRobotIndex, 0, 0)]
var visited = [Bool](repeating: false, count: n+1)
var totalWeight = 0
var maxWeight = 0

visited[firstRobotIndex] = true
var index = 0

while !needVisitQueue.isEmpty {
    let node = needVisitQueue[index]
    index += 1
    
    if node.0 == secondRobotIndex {
        totalWeight = node.1
        maxWeight = node.2
        break
    }
    
    for connect in graph[node.0, default: []] {
        if visited[connect.endNode] { continue }
        visited[connect.endNode] = true
        
        needVisitQueue.append((connect.endNode, node.1+connect.weight, max(node.2, connect.weight)))
        
    }
}




print(totalWeight - maxWeight)
