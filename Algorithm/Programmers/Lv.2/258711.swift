//
//  258711.swift
//  Algorithm
//
//  Created by 송지혁 on 5/21/26.
//

import Foundation

func bfs(_ start: Int, graph: [Int: [Int]]) -> (Int, Int) {
    var visitedNodes: Set<Int> = [start]
    var edge = 0
    
    var queue = [start]
    var head = 0
    
    while head < queue.count {
        let node = queue[head]
        head += 1
        
        for neighbor in graph[node, default: []] {
            edge += 1
            if visitedNodes.contains(neighbor) { continue }
            visitedNodes.update(with: neighbor)
            queue.append(neighbor)
        }
    }
    
    return (visitedNodes.count, edge)
}

func isDonutGraph(_ node: Int, graph: [Int: [Int]]) -> Bool {
    let (node, edge) = bfs(node, graph: graph)
    
    return node - edge == 0
}

func isEightGraph(_ node: Int, graph: [Int: [Int]]) -> Bool {
    let (node, edge) = bfs(node, graph: graph)
    
    return node - edge == 1
}

func isPoleGraph(_ node: Int, graph: [Int: [Int]]) -> Bool {
    let (node, edge) = bfs(node, graph: graph)
    
    return node - edge == -1
}

func solution(_ edges: [[Int]]) -> [Int] {
    var graph: [Int: [Int]] = [:]
    var fanIn: [Int: Int] = [:]
    var fanOut: [Int: Int] = [:]
    var nodeNumbers: Set<Int> = []
    var result = Array(repeating: 0, count: 4)
    
    for edge in edges {
        let a = edge[0]
        let b = edge[1]
        
        fanIn[b, default: 0] += 1
        fanOut[a, default: 0] += 1
        
        nodeNumbers.update(with: a)
        nodeNumbers.update(with: b)
        
        graph[a, default: []].append(b)
    }
    
    for node in nodeNumbers {
        if let fanOut = fanOut[node] {
            if fanIn[node, default: 0] == 0, fanOut > 1 {
                result[0] = node
                break
            }
        }
    }
    
    let generatedNode = result[0]
    
    for node in graph[generatedNode, default: []] {
        if isDonutGraph(node, graph: graph) {
            result[1] += 1
            continue
        }
        
        if isEightGraph(node, graph: graph) {
            result[2] += 1
            continue
        }
        
        if isPoleGraph(node, graph: graph) {
            result[3] += 1
            continue
        }
    }
    
    return result
}
