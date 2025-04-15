//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/15/25.
//

import Foundation

let N = Int(readLine()!)!
let population = readLine()!.split(separator: " ").map { Int($0)! }
var graph = Array(repeating: [Int](), count: N+1)
var result = Int.max

for i in 1..<N+1 {
    let neighbors = readLine()!.split(separator: " ").map { Int($0)! }
    
    for j in 0..<neighbors.count-1 {
        let neighbor = neighbors[j+1]
        graph[i].append(neighbor)
        graph[neighbor].append(i)
    }
}

func nodesAreDirectlyLinked(graph: [[Int]], nodes: [Int]) -> Bool {
    var needVisitQueue: [Int] = [nodes.first!]
    var visitedQueue: [Int] = []
    
    while !needVisitQueue.isEmpty {
        let node = needVisitQueue.removeFirst()
        if !nodes.contains(node) { continue }
        if visitedQueue.contains(node) { continue }
        visitedQueue.append(node)
        
        needVisitQueue.append(contentsOf: graph[node])
    }
    
    for node in nodes {
        if !visitedQueue.contains(node) { return false }
    }
    
    
    return true
}

func generateSubsetsBit(_ elements: [Int]) -> [[Int]] {
    var result: [[Int]] = []
    
    for bit in 1..<(1 << N - 1) {
        var subset: [Int] = []
        
        for i in 0..<N {
            if bit & (1 << i) != 0 {
                subset.append(elements[i])
            }
        }
        
        result.append(subset)
    }
    
    return result
}

func generateSubsets(_ elements: [Int]) -> [[Int]] {
    var result: [[Int]] = []
    
    func dfs(index: Int, path: [Int]) {
        if index == elements.count {
            if !path.isEmpty && path.count < elements.count {
                result.append(path)
            }
            
            return
        }
        
        dfs(index: index + 1, path: path)
        dfs(index: index + 1, path: path + [elements[index]])
    }
    
    dfs(index: 0, path: [])
    return result
}


var subsets = generateSubsetsBit(Array(1...N))

for subset in subsets {
    let groupA = subset
    let groupB = Array(1...N).filter { !groupA.contains($0) }
    
    if nodesAreDirectlyLinked(graph: graph, nodes: groupA) && nodesAreDirectlyLinked(graph: graph, nodes: groupB) {
        let groupAPopulation = groupA.map { population[$0-1] }.reduce(0, +)
        let groupBPopulation = groupB.map { population[$0-1] }.reduce(0, +)
        
        result = min(result, abs(groupAPopulation - groupBPopulation))
    }
}

print(result == Int.max ? -1 : result)
