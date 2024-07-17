//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 7/24/24.
//

let n = Int(readLine()!)!
var graph: [Int: [Int]] = [:]
var resultArray = Array(repeating: 0, count: n+1)

for _ in 0..<n-1 {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let n = input[0]
    let m = input[1]
    
    graph[n, default: []].append(m)
    graph[m, default: []].append(n)
}

dfs(start: 1)


func dfs(start: Int) {
    if start > n { return }
    
    for node in graph[start]! {
        if resultArray[node] != 0 { continue }
        resultArray[node] = start
        dfs(start: node)
        
        
    }
}

for i in 2..<n+1 {
    print(resultArray[i])
}
