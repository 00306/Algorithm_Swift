//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 5/27/24.
//

import Foundation

var board: [[Int]] = []
var result = ""

for _ in 0..<9 {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    board.append(input)
}

dfs(0, 0)

func dfs(_ x: Int, _ y: Int) {
    if y == 9 {
        board.forEach { result += "\($0.map { String($0) }.joined(separator: " "))\n" }
        print(result)
        exit(0)
    }
    
    for newX in x..<9 where board[y][newX] == 0 {
        for num in findNums(i: y, j: newX) {
            board[y][newX] = num
            dfs(newX+1, y)
            board[y][newX] = 0
        }
        return
    }

    dfs(0, y+1)
}


func findNums(i: Int, j: Int) -> [Int] {
    var existNumbers: Set<Int> = []
    
    // horizontal Check
    // Vertical Check
    for index in 0..<9 {
        existNumbers.insert(board[i][index])
        existNumbers.insert(board[index][j])
    }
    
    // Square Check
    let squareXIndex = j - (j % 3)
    let squareYIndex = i - (i % 3)
    
    for squareY in squareYIndex..<squareYIndex+3 {
        for squareX in squareXIndex..<squareXIndex+3 {
            existNumbers.insert(board[squareY][squareX])
        }
    }
    
    return [1, 2, 3, 4, 5, 6, 7, 8, 9].filter { !existNumbers.contains($0) }
}

//0 0 0 0 0 0 0 0 0
//0 0 0 0 0 0 0 0 0
//0 0 0 0 0 0 0 0 0
//0 0 0 0 0 0 0 0 0
//0 0 0 0 0 0 0 0 0
//0 0 0 0 0 0 0 0 0
//0 0 0 0 0 0 0 0 0
//0 0 0 0 0 0 0 0 0
//0 0 0 0 0 0 0 0 0
