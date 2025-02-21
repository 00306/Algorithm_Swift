//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 2/21/25.
//

let n = Int(readLine()!)!
var result = ""
var visited = Array(repeating: false, count: n)

func dfs(count: Int, array: [Int]) {
    if count == n {
        result += array.map { String($0) }.joined(separator: " ")
        result += "\n"
        return
    }
    
    for i in 0..<n {
        if visited[i] { continue }
        visited[i] = true
        dfs(count: count + 1, array: array + [i+1])
        visited[i] = false
    }
}

dfs(count: 0, array: [])
print(result)
