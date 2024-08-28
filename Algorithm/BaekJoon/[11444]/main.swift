//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 9/24/24.
//

let n = Int(readLine()!)!
let A = [[1, 1], [1, 0]]
let fibonacci = [[1], [0]]
let mod = 1_000_000_007



func multiply(matrixA: [[Int]], matrixB: [[Int]]) -> [[Int]] {
    var matrix: [[Int]] = []
    
    for i in 0..<matrixA.count {
        var row: [Int] = []
        var sum = 0
        
        for j in 0..<matrixB[i].count {
            for k in 0..<matrixB.count {
                sum += matrixA[i][k] * matrixB[k][j] % mod
            }
            
            row.append(sum % mod)
            sum = 0
        }
        
        matrix.append(row)
    }
    
    return matrix
}

func pow(matrix: [[Int]], exponent: Int) -> [[Int]] {
    if exponent == 0 { return [[1, 0], [0, 1]] }
    if exponent == 1 { return matrix }
    if exponent % 2 == 1 { return multiply(matrixA: matrix, matrixB: pow(matrix: matrix, exponent: exponent - 1)) }
    
    let half = pow(matrix: matrix, exponent: exponent / 2)
    
    return multiply(matrixA: half, matrixB: half)
}

print(multiply(matrixA: pow(matrix: A, exponent: n-1), matrixB: fibonacci)[0][0])
