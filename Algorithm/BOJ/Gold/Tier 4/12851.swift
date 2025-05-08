//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 5/8/25.
//

let NK = readLine()!.split(separator: " ").map { Int($0)! }
let N = NK[0]
let K = NK[1]

func hideAndSeek(start: Int, end: Int) -> (Int, Int) {
    var queue = [(start, 0)]
    var visited = [Bool](repeating: false, count: 100002)
    var head = 0
    var minTime = Int.max
    var count = 0
    
    while head < queue.count {
        let current = queue[head]
        head += 1
        
        visited[current.0] = true
        if current.0 == end {
            minTime = min(current.1, minTime)
            if minTime == current.1 { count += 1 }
            continue
        }
        
        let neighbors = [(current.0 * 2, current.1+1), (current.0-1, current.1+1), (current.0+1, current.1+1)]
        
        for neighbor in neighbors {
            if neighbor.0 < 0 || neighbor.0 > 100000 { continue }
            if visited[neighbor.0] { continue }
            queue.append(neighbor)
        }
        
    }
    
    return (minTime, count)
}

let result = hideAndSeek(start: N, end: K)
print(result.0, result.1, separator: "\n")
