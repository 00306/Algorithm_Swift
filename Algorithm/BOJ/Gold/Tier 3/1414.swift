//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 11/12/25.
//

struct UnionFind {
    private var parent: [Int]
    private var rank: [Int]
    
    init(_ n: Int) {
        self.parent = Array(0..<n)
        self.rank = Array(repeating: 0, count: n)
    }
    
    mutating func find(_ x: Int) -> Int {
        if parent[x] != x {
            parent[x] = find(parent[x])
        }
        
        return parent[x]
    }
    
    mutating func union(_ x: Int, _ y: Int) -> Bool {
        let rootX = find(x)
        let rootY = find(y)
        
        if rootX == rootY { return false }
        
        if rank[rootX] < rank[rootY] {
            parent[rootX] = rootY
        } else if rank[rootX] > rank[rootY] {
            parent[rootY] = rootX
        } else {
            parent[rootY] = rootX
            rank[rootX] += 1
        }
        
        return true
    }
}

struct Edge {
    let u: Int
    let v: Int
    let w: Int
}

func weight(of char: Character) -> Int {
    if char == "0" { return 0 }
    if let ascii = char.asciiValue {
        if ascii >= Character("a").asciiValue!, ascii <= Character("z").asciiValue! {
            return Int(ascii - Character("a").asciiValue! + 1)
        } else if ascii >= Character("A").asciiValue!, ascii <= Character("Z").asciiValue! {
            return Int(ascii - Character("A").asciiValue! + 27)
        }
    }
    
    return 0
}

let n = Int(readLine()!)!
var edges: [Edge] = []
var total = 0

for i in 0..<n {
    let input = readLine()!.map { $0 }
    
    for j in 0..<input.count {
        let weight = weight(of: input[j])
        let edge = Edge(u: i, v: j, w: weight)
        
        total += weight
        if i != j, weight > 0 {
            edges.append(edge)
            
        }
    }
}

edges.sort(by: { $0.w < $1.w })

var unionFind = UnionFind(n)
var minWeight = 0
var picked = 0

for edge in edges {
    if unionFind.union(edge.u, edge.v) {
        minWeight += edge.w
        picked += 1
    }
    
    if picked == n-1 { break }
}


if n == 1 {
    print(total)
} else if picked == n-1 {
    print(total - minWeight)
} else {
    print(-1)
}

