//
//  10775.swift
//  Algorithm
//
//  Created by 송지혁 on 1/23/26.
//

let gateCount = Int(readLine()!)!
let planeCount = Int(readLine()!)!
var gateNumbers: [Int] = []

for _ in 0..<planeCount {
    let gateNumber = Int(readLine()!)!
    gateNumbers.append(gateNumber)
}

var parent = Array(0...gateCount)

func find(_ x: Int) -> Int {
    if parent[x] != x {
        parent[x] = find(parent[x])
    }
    
    return parent[x]
}

func union(_ a: Int, _ b: Int) {
    let rootA = find(a)
    let rootB = find(b)
    
    if rootA != rootB {
        parent[rootA] = rootB
    }
}

var result = 0

for gateNumber in gateNumbers {
    let parent = find(gateNumber)
    if parent == 0 { break }
    
    union(parent, parent-1)
    result += 1
}

print(result)

