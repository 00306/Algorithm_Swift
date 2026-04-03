//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/3/26.
//

let NM = readLine()!.split(separator: " ").map { Int($0)! }
let N = NM[0]
let M = NM[1]

var visited: [[Bool]] = Array(repeating: [Bool](repeating: false, count: M), count: N)
var memo: [[Int]] = Array(repeating: [Int](repeating: -2, count: M), count: N)

var board: [[Character]] = []

for _ in 0..<N {
    let line = readLine()!.map { $0 }
    
    board.append(line)
}


func dfs(i: Int, j: Int) -> Int {
    if i < 0 || i >= N || j < 0 || j >= M || board[i][j] == "H" {
        return 0
    }
    
    if visited[i][j] { return -1 }
    if memo[i][j] != -2  { return memo[i][j] }
    
    visited[i][j] = true
    var maxMove = 0
    
    let move = Int(String(board[i][j]))!
    
    let directions = [(-move, 0), (0, move), (move, 0), (0, -move)]
    
    for direction in directions {
        let dx = direction.1
        let dy = direction.0
        
        let result = dfs(i: i+dy, j: j+dx)
        if result == -1 { return -1 }
        
        
        maxMove = max(maxMove, result + 1)
        
    }
    
    visited[i][j] = false
    memo[i][j] = maxMove
    
    return maxMove
}


print(dfs(i: 0, j: 0))
