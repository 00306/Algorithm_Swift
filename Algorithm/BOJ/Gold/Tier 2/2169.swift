//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 7/28/25.
//

let NM = readLine()!.split(separator: " ").map { Int($0)! }
let N = NM[0]
let M = NM[1]

let directions = [(0, 1), (0, -1), (1, 0)]

var graph: [[Int]] = []

for _ in 0..<N {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    graph.append(line)
}

var dp = Array(repeating: [Int](repeating: 0, count: M), count: N)

dp[0][0] = graph[0][0]

for x in 1..<M {
    dp[0][x] = dp[0][x-1] + graph[0][x]
}


for y in 1..<N {
    var fromLeft = Array(repeating: Int.min, count: M)
    var fromRight = Array(repeating: Int.min, count: M)
    
    fromLeft[0] = dp[y-1][0] + graph[y][0]
    
    for x in 1..<M {
        fromLeft[x] = max(dp[y-1][x], fromLeft[x-1]) + graph[y][x]
    }
    
    fromRight[M-1] = dp[y-1][M-1] + graph[y][M-1]
    
    for x in stride(from: M-2, through: 0, by: -1) {
        fromRight[x] = max(dp[y-1][x], fromRight[x+1]) + graph[y][x]
    }
    
    
    for x in 0..<M {
        dp[y][x] = max(fromLeft[x], fromRight[x])
    }
}

print(dp[N-1][M-1])
