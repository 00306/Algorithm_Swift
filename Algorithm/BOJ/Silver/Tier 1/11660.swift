//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 6/24/24.
//

let NM = readLine()!.split(separator: " ").map { Int($0)! }
let N = NM[0]
let M = NM[1]
var graph: [[Int]] = [Array(repeating: 0, count: N+1)]
var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: N+1), count: N+1)
var coordinates: [(start: (Int, Int), end: (Int, Int))] = []
var result = ""

for _ in 0..<N {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    graph.append([0] + input)
}

for _ in 0..<M {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let startCoordinate = (input[1], input[0])
    let endCoordinate = (input[3], input[2])
    
    coordinates.append((startCoordinate, endCoordinate))
}

for i in 1..<N+1 {
    for j in 1..<N+1 {
        dp[i][j] = dp[i][j-1] + dp[i-1][j] - dp[i-1][j-1] + graph[i][j]
    }
}

for coordinate in coordinates {
    var sum = 0
    let startXIndex = coordinate.start.0 - 1
    let startYIndex = coordinate.start.1 - 1
    let endXIndex = coordinate.end.0
    let endYIndex = coordinate.end.1
    
    sum = dp[endYIndex][endXIndex] - dp[endYIndex][startXIndex] - dp[startYIndex][endXIndex] + dp[startYIndex][startXIndex]
    
    result += "\(sum)\n"
}

print(result)
