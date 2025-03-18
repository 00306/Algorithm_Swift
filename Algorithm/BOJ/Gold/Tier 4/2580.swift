//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 5/27/24.
//

import Foundation

var board: [[Int]] = []
var emptyCoordinate: [(Int, Int)] = []
var result = ""

for i in 0..<9 {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    board.append(input)
}

for i in 0..<9 {
    for j in 0..<9 {
        if board[i][j] == 0 {
            emptyCoordinate.append((i, j))
        }
    }
}

dfs(0)

func isValidRow(num: Int, x: Int) -> Bool {
    for i in 0..<9 {
        if board[i][x] == num {
            return false
        }
    }
    
    return true
}

func isValidColumn(num: Int, y: Int) -> Bool {
    for i in 0..<9 {
        if board[y][i] == num {
            return false
        }
    }
    
    return true
}

func isValidRect(x: Int, y: Int, num: Int) -> Bool {
    let startX = x / 3 * 3
    let startY = y / 3 * 3
    
    for i in 0..<3 {
        for j in 0..<3 {
            if board[startY + i][startX + j] == num {
                return false
            }
        }
    }
    
    
    return true
}

func dfs(_ count: Int) {
    if count == emptyCoordinate.count {
        board.forEach { result += "\($0.map { String($0) }.joined(separator: " "))\n" }
        print(result)
        exit(0)
    }
    
    let x = emptyCoordinate[count].1
    let y = emptyCoordinate[count].0
    
    for num in 1...9 {
        if isValidRow(num: num, x: x), isValidColumn(num: num, y: y), isValidRect(x: x, y: y, num: num) {
            board[y][x] = num
            dfs(count + 1)
            board[y][x] = 0
        }
    }
}
