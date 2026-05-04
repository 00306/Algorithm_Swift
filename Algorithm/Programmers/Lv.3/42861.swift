//
//  42861.swift
//  Algorithm
//
//  Created by 송지혁 on 5/4/26.
//

import Foundation

func solution(_ n: Int, _ costs: [[Int]]) -> Int {
    var parent = Array(0..<n)
    var rank = Array(repeating: 0, count: n)
    
    var result = 0
    
    func find(_ node: Int) -> Int {
        if parent[node] == node { return node }
        
        parent[node] = find(parent[node])
        
        return parent[node]
    }
    
    func union(_ node1: Int, _ node2: Int) {
        let node1Parent = find(node1)
        let node2Parent = find(node2)
        
        if node1Parent == node2Parent { return }
        
        if rank[node1Parent] > rank[node2Parent] {
            parent[node2Parent] = node1Parent
        } else if rank[node1Parent] < rank[node2Parent] {
            parent[node1Parent] = node2Parent
        } else {
            parent[node1Parent] = node2Parent
            rank[node2Parent] += 1
        }
    }
    
    for connect in costs.sorted(by: { $0[2] < $1[2] })  {
        if find(connect[0]) != find(connect[1]) {
            union(connect[0], connect[1])
            result += connect[2]
        }
    }
    
    return result
}
