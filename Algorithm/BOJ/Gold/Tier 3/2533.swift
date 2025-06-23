//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 6/23/25.
//

let N = Int(readLine()!)!
var tree: [Int: [Int]] = [:]
var dp = Array(repeating: [Int](repeating: Int.max, count: 2), count: N+1)
var visited = Array(repeating: false, count: N+1)

for _ in 0..<N-1 {
    let connect = readLine()!.split(separator: " ").map { Int($0)! }
    tree[connect[0], default: []].append(connect[1])
    tree[connect[1], default: []].append(connect[0])
}

func getMinEarlyAdapter(root: Int) {
    visited[root] = true
    dp[root][0] = 0
    dp[root][1] = 1
    
    for child in tree[root, default: []] {
        if visited[child] { continue }
        
        getMinEarlyAdapter(root: child)
        dp[root][0] += dp[child][1]
        dp[root][1] += min(dp[child][0], dp[child][1])
    }
}

getMinEarlyAdapter(root: 1)
print(min(dp[1][0], dp[1][1]))
