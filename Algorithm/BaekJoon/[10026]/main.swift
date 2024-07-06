//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 7/8/24.
//

let n = Int(readLine()!)!

var visited = Array(repeating: Array(repeating: false, count: n), count: n)
var map: [[String]] = []
var normalCount = 0
var blindnessCount = 0

for _ in 0..<n {
    let line = readLine()!.map { String($0) }
    map.append(line)
}

func dfs(color: String, blindness: Bool, i: Int, j: Int) {
    if i >= n || i < 0 || j >= n || j < 0 || visited[i][j] { return }
    if map[i][j] != color {
        if blindness {
            if color == "B" || map[i][j] == "B" { return }
        } else { return }
    }
    
    visited[i][j] = true
    
    
    dfs(color: color, blindness: blindness, i: i, j: j+1)
    dfs(color: color, blindness: blindness, i: i, j: j-1)
    dfs(color: color, blindness: blindness, i: i-1, j: j)
    dfs(color: color, blindness: blindness, i: i+1, j: j)
}


for i in 0..<n {
    for j in 0..<n {
        if visited[i][j] { continue }
        dfs(color: map[i][j], blindness: false, i: i, j: j)
        normalCount += 1
    }
}

visited = Array(repeating: Array(repeating: false, count: n), count: n)


for i in 0..<n {
    for j in 0..<n {
        if visited[i][j] { continue }
        dfs(color: map[i][j], blindness: true, i: i, j: j)
        blindnessCount += 1
    }
}

print(normalCount, blindnessCount)
