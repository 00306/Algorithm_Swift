//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 12/17/24.
//

let T = Int(readLine()!)!

for _ in 0..<T {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let n = input[0]
    let m = input[1]
    var graph: [Int: [Int]] = [:]
    
    for _ in 0..<m {
        let AB = readLine()!.split(separator: " ").map { Int($0)! }
        let A = AB[0]
        let B = AB[1]
        graph[A, default: []].append(B)
        graph[B, default: []].append(A)
    }
    
    func bfs(start: Int) -> Int {
        var needVisitQueue = [start]
        var visitedQueue: [Int] = []
        var count = -1
        
        while !needVisitQueue.isEmpty {
            let node = needVisitQueue.removeFirst()
            if visitedQueue.contains(node) { continue }
            count += 1
            visitedQueue.append(node)
            needVisitQueue.append(contentsOf: graph[node]!)
        }
        
        return count
    }
    
    print(bfs(start: graph.randomElement()!.key))
}


