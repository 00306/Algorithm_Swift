//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 12/17/24.
//

import Foundation

final class FileIO {
    private var buffer:[UInt8]
    private var index: Int
    
    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(fileHandle.readDataToEndOfFile())+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
        index = 0
    }
    
    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }
        
        return buffer.withUnsafeBufferPointer { $0[index] }
    }
    
    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true
        
        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45{ isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }
        
        return sum * (isPositive ? 1:-1)
    }
    
    @inline(__always) func readString() -> String {
        var str = ""
        var now = read()
        
        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        
        while now != 10
                && now != 32 && now != 0 {
            str += String(bytes: [now], encoding: .ascii)!
            now = read()
        }
        
        return str
    }
}

struct Edge: Comparable {
    let u: Int
    let v: Int
    let weight: Int
    
    static func < (lhs: Edge, rhs: Edge) -> Bool {
        return lhs.weight < rhs.weight
    }
}

let fileIO = FileIO()
var result = ""

while true {
    let m = fileIO.readInt(), n = fileIO.readInt()
    if m == 0, n == 0 { break }
    var edges: [Edge] = []
    var parents = [Int](0..<m)
    var ranks = Array(repeating: 1, count: m)
    
    for _ in 0..<n {
        let x = fileIO.readInt(), y = fileIO.readInt(), z = fileIO.readInt()
        
        let edge = Edge(u: x, v: y, weight: z)
        edges.append(edge)
    }
    
    result += "\(calculateCost(edges: edges))\n"
    
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
    
    func calculateCost(edges: [Edge]) -> Int {
        var cost = 0
        let sortedEdges = edges.sorted()
        
        for edge in sortedEdges {
            if !union(edge.u, edge.v) { cost += edge.weight }
        }
        
        return cost
    }
    
}

print(result)
