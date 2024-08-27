//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 9/19/24.
//

let matrixASize = readLine()!.split(separator: " ").map { Int($0)! }
let matrixACol = matrixASize[0]
let matrixARow = matrixASize[1]
var matrixA: [[Int]] = []

for _ in 0..<matrixACol {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    matrixA.append(line)
}

let matrixBSize = readLine()!.split(separator: " ").map { Int($0)! }
let matrixBRow = matrixBSize[1]
var matrixB: [[Int]] = []

for _ in 0..<matrixARow {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    matrixB.append(line)
}

var matrixC: [[String]] = []

for i in 0..<matrixACol {
    var row: [String] = []
    
    for j in 0..<matrixBRow {
        var matrixMul = 0
        
        for k in 0..<matrixARow {
            matrixMul += matrixA[i][k] * matrixB[k][j]
        }
        row.append(String(matrixMul))
    }
    matrixC.append(row)
}

matrixC.forEach { print($0.joined(separator: " ")) }
