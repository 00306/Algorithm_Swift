//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 5/24/24.
//

let n = Int(readLine()!)!

var board = Array(repeating: 0, count: n)
var visited = Array(repeating: false, count: n)
var result = 0

dfs(x: 0)
print(result)

func dfs(x: Int) {
    if x == n {
        result += 1
    }
    
    for i in 0..<n {
        if visited[i] { continue }
        board[x] = i
        
        if check(x: x) {
            visited[i] = true
            dfs(x: x+1)
            visited[i] = false
        }
    }
}

func check(x: Int) -> Bool {
    for i in 0..<x {
        if board[x] == board[i] {
           return false
        }
        
        if abs(i - x) == abs(board[i] - board[x]) {
            return false
        }
    }
    
    return true
}
