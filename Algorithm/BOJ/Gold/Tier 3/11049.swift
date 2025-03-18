//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 11/6/24.
//

let N = Int(readLine()!)!

var matrixes: [(Int, Int)] = []

for _ in 0..<N {
    let matrix = readLine()!.split(separator: " ").map { Int($0)! }
    matrixes.append((matrix[0], matrix[1]))
}

var dp = Array(repeating: Array(repeating: 0, count: N+1), count: N+1)
var matrixTable = Array(repeating: Array(repeating: (1, 1), count: N+1), count: N+1)

func calculateOperationCount(first: (Int, Int), second: (Int, Int)) -> Int {
    return first.0 * second.0 * second.1
}

func multiplyMatrix(first: (Int, Int), second: (Int, Int)) -> (Int, Int) {
    return (first.0, second.1)
}



for i in 1...N {
    matrixTable[i][i] = matrixes[i-1]
    
    for j in i+1..<N+1 {
        matrixTable[i][j] = multiplyMatrix(first: matrixTable[i][j-1], second: matrixes[j-1])
    }
}

for length in 2...N {
    for start in 1...(N - length + 1) {
        let end = start + length - 1
        
        dp[start][end] = Int.max
        for splitPoint in start..<end {
            let operationCount = dp[start][splitPoint] + dp[splitPoint+1][end] + calculateOperationCount(first: matrixTable[start][splitPoint], second: matrixTable[splitPoint+1][end])
            
            dp[start][end] = min(dp[start][end], operationCount)
        }
        
    }
}


print(dp[1][N])
