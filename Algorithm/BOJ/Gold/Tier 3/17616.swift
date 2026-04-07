//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/7/26.
//

enum Direction {
    case up
    case down
}

let NMX = readLine()!.split(separator: " ").map { Int($0)! }
let N = NMX[0]
let M = NMX[1]
let X = NMX[2]

var forwardGraph: [Int: [Int]] = [:]
var backwardGraph: [Int: [Int]] = [:]

for _ in 0..<M {
    let compare = readLine()!.split(separator: " ").map { Int($0)! }
    let biggerNumber = compare[0]
    let smallerNumber = compare[1]
    
    forwardGraph[biggerNumber, default: []].append(smallerNumber)
    backwardGraph[smallerNumber, default: []].append(biggerNumber)
    
}

func bfs(from x: Int, direction: Direction) -> Int {
    let graph = direction == .up ? backwardGraph : forwardGraph
    var needVisitQueue = [x]
    var index = 0
    var count = 0
    var visited = [Bool](repeating: false, count: N+1)
    
    while index < needVisitQueue.count {
        let node = needVisitQueue[index]
        index += 1
        
        for nextNode in graph[node, default: []] {
            if visited[nextNode] { continue }
            visited[nextNode] = true
            needVisitQueue.append(nextNode)
            count += 1
        }
    }
    
    
    return count
}

print(bfs(from: X, direction: .up) + 1, N - bfs(from: X, direction: .down))




