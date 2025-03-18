//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 12/17/24.
//

struct Edge: Comparable {
    let u: Int
    let v: Int
    let weight: Int
    
    static func < (lhs: Edge, rhs: Edge) -> Bool {
        return lhs.weight < rhs.weight
    }
}

let VE = readLine()!.split(separator: " ").map { Int($0)! }
let V = VE[0]
let E = VE[1]
var edges: [Edge] = []
var parents = [Int](0..<V)
var ranks = Array(repeating: 1, count: V)

for _ in 0..<E {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let edge = Edge(u: input[0] - 1, v: input[1] - 1, weight: input[2])
    edges.append(edge)
}

func find(_ x: Int) -> Int {
    if parents[x] != x { parents[x] = find(parents[x]) }
    return parents[x]
}

func union(_ x: Int, _ y: Int) -> Bool {
    let rootX = find(x)
    let rootY = find(y)
    
    if rootX == rootY { return false }
    
    if ranks[rootX] > ranks[rootY] {
        parents[rootY] = rootX
    } else if ranks[rootX] < ranks[rootY] {
        parents[rootX] = rootY
    } else {
        parents[rootY] = rootX
        ranks[rootX] += 1
    }
    
    return true
}


func minimumSpanningTree(edges: [Edge]) -> [Edge] {
    var mst: [Edge] = []
    let sortedEdges = edges.sorted()
    
    for edge in sortedEdges {
        if union(edge.u, edge.v) {
            mst.append(edge)
        }
    }
    
    return mst
}

var result = 0
let mst = minimumSpanningTree(edges: edges)
for edge in mst {
    result += edge.weight
}

print(result)
