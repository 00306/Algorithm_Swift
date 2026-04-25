//
//  네트워크.swift
//  Algorithm
//
//  Created by 송지혁 on 4/25/26.
//

import Foundation

func solution(_ n: Int, _ computers: [[Int]]) -> Int {
    var visited = Array(repeating: false, count: n)
    var count = 0
    
    func dfs(node: Int) {
        visited[node] = true
        
        for next in 0..<n where computers[node][next] == 1 && !visited[next] {
            dfs(node: next)
        }
    }
    
    for i in 0..<n {
        if !visited[i] {
            dfs(node: i)
            count += 1
        }
    }
    
    
    return count
}
