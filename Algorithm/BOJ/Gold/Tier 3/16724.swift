//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 5/1/25.
//

import Foundation

let NM = readLine()!.split(separator: " ").map { Int($0)! }
let N = NM[0]
let M = NM[1]
var directionGraph = Array(repeating: [String](), count: N)
var pathIDs = Array(repeating: [Int](repeating: 0, count: M), count: N)
var currentPathID = 1
var count = 0

for i in 0..<N {
    let line = readLine()!.map { String($0) }
    directionGraph[i] = line
}

func move(x: Int, y: Int, graph: [[String]]) -> (nextX: Int, nextY: Int) {
    switch graph[y][x] {
        case "U": return (x, y-1)
        case "D": return (x, y+1)
        case "L": return (x-1, y)
        case "R": return (x+1, y)
        default: return (x, y)
    }
}

func dfs(x: Int, y: Int, pathID: Int) {
    if pathIDs[y][x] != 0 {
        if pathIDs[y][x] == pathID { count += 1 }
        return
    }
    
    pathIDs[y][x] = pathID
    let (nextX, nextY) = move(x: x, y: y, graph: directionGraph)
    dfs(x: nextX, y: nextY, pathID: pathID)
    
}

for i in 0..<N {
    for j in 0..<M {
        if pathIDs[i][j] != 0 { continue }
        dfs(x: j, y: i, pathID: currentPathID)
        currentPathID += 1
    }
}

print(count)
