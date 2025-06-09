//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 6/9/25.
//

let N = Int(readLine()!)!

var buildTime = Array(repeating: 0, count: N+1)
var inDegree = Array(repeating: 0, count: N+1)
var adjecents = Array(repeating: [Int](), count: N+1)
var dp = Array(repeating: 0, count: N+1)

for i in 1..<N+1 {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    buildTime[i] = input[0]
    
    for adjecent in input[1...] {
        if adjecent == -1 { break }
        inDegree[i] += 1
        adjecents[adjecent].append(i)
    }
}

var queue: [Int] = []

for i in 1..<N+1 {
    if inDegree[i] == 0 {
        queue.append(i)
    }
}

while !queue.isEmpty {
    let node = queue.removeFirst()
    dp[node] += buildTime[node]
    
    for adjecent in adjecents[node] {
        inDegree[adjecent] -= 1
        if inDegree[adjecent] == 0 { queue.append(adjecent) }
        dp[adjecent] = max(dp[adjecent], dp[node])
    }
}

dp[1...].forEach { print($0) }
