//
//  17679.swift
//  Algorithm
//
//  Created by 송지혁 on 8/18/26.
//

func solution(_ m: Int, _ n: Int, _ board: [String]) -> Int {
    var result = 0
    var currentBoard = board.map { $0.split(separator: "") }
    
    while true {
        var bomb = 0
        var bombMap = Array(repeating: [Bool](repeating: false, count: n), count: m)
        
        for i in 0..<m {
            for j in 0..<n {
                if i+1 >= m || j+1 >= n { continue }
                let shape = currentBoard[i][j]
                
                if currentBoard[i][j+1] == shape,
                   currentBoard[i+1][j] == shape,
                   currentBoard[i+1][j+1] == shape {
                    bombMap[i][j] = true
                }
            }
        }
        
        for i in 0..<m {
            for j in 0..<n {
                if bombMap[i][j] {
                    if currentBoard[i][j] != "" {
                        currentBoard[i][j] = ""
                        bomb += 1
                    }
                    
                    if currentBoard[i][j+1] != "" {
                        currentBoard[i][j+1] = ""
                        bomb += 1
                    }
                    
                    if currentBoard[i+1][j] != "" {
                        currentBoard[i+1][j] = ""
                        bomb += 1
                    }
                    
                    if currentBoard[i+1][j+1] != "" {
                        currentBoard[i+1][j+1] = ""
                        bomb += 1
                    }
                }
            }
        }
        
        for i in stride(from: m-2, through: 0, by: -1) {
            for j in 0..<n {
                if currentBoard[i][j] != "", currentBoard[i+1][j] == "" {
                    var base = i
                    
                    while base+1 < m {
                        if currentBoard[base+1][j] == "" { base += 1 }
                        else { break }
                    }
                    
                    currentBoard[base][j] = currentBoard[i][j]
                    currentBoard[i][j] = ""
                }
            }
        }
        
        if bomb == 0 { break }
        result += bomb
    }
    
    return result
}
