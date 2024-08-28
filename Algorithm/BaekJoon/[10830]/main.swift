//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 9/23/24.
//

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let b = input[1]

var matrix: [[Int]] = []

for _ in 0..<n {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    matrix.append(line)
}


func multiply(matrixA: [[Int]], matrixB: [[Int]]) -> [[Int]] {
    var matrix: [[Int]] = []
    
    for i in 0..<n {
        var row: [Int] = []
        
        for j in 0..<n {
            var sum = 0
            
            for k in 0..<n {
                sum += matrixA[i][k] * matrixB[k][j] % 1000
            }
            
            row.append(sum % 1000)
        }
        
        matrix.append(row)
    }
    
    return matrix
}

func pow(matrix: [[Int]], exponent: Int) -> [[Int]] {
    if exponent == 1 { return matrix }
    if exponent % 2 == 1 { return multiply(matrixA: matrix, matrixB: pow(matrix: matrix, exponent: exponent - 1)) }
    
    let half = pow(matrix: matrix, exponent: exponent / 2)
    
    return multiply(matrixA: half, matrixB: half)
}

let resultMatrix = pow(matrix: matrix, exponent: b)

for row in resultMatrix {
    for num in row {
        print(num % 1000, terminator: " ")
    }
    print()
}
