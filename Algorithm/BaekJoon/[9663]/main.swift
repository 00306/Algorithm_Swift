//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 5/24/24.
//

let n = Int(readLine()!)!
var board = Array(repeating: Array(repeating: false, count: n+1), count: n+1)
var index = 1
var result = 0

for i in 1...n {
    for j in 1...n {
        board = Array(repeating: Array(repeating: false, count: n+1), count: n+1)
        dfs(0, x: j, y: i)
    }
}


func dfs(_ count: Int, x: Int, y: Int) {
    if count == n {
        result += 1
    }
    
    if !board[y][x] {
//        print(y, x)
        let newCount = count + 1
        queenMove(state: true, y: y, x: x)
//        board.forEach { print($0) }
//        print(newCount)
//        print("\n")
        
        for i in 1...n {
            for j in 1...n {
                dfs(newCount, x: j, y: i)
                
            }
        }
    }
}

func queenMove(state: Bool, y: Int, x: Int) {
    // Queen Horizontal Move
    board[y] = Array(repeating: state, count: n+1)
    
    // Queen Vertical Move
    for i in 1...n {
        board[i][x] = state
    }
    
    // Queen Directional Move
    // Top Left Directional Move
    while true {
        if x - index == 0 || y - index == 0 {
            index = 1
            break
        }
        
        board[y - index][x - index] = state
        index += 1
    }
    
    // Top Right Directional Move
    while true {
        if x + index == n + 1 || y - index == 0 {
            index = 1
            break
        }
        
        board[y - index][x + index] = state
        index += 1
    }
    
    
    // Bottom Left Directional Move
    while true {
        if x - index == 0 || y + index == n+1 {
            index = 1
            break
        }
        
        board[y + index][x - index] = state
        index += 1
    }
    
    // Bottom Right Directional Move
    while true {
        if x + index == n+1 || y + index == n+1 {
            index = 1
            break
        }
        
        board[y + index][x + index] = state
        index += 1
    }
}

print(result)

