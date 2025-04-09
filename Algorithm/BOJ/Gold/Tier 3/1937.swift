//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/9/25.
//

let n = Int(readLine()!)!
var space: [[Int]] = []
var dp = Array(repeating: Array(repeating: 0, count: n), count: n)

for _ in 0..<n {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    space.append(line)
}

let directions = [(1, 0), (-1, 0), (0, 1), (0, -1)]
var result = Int.min

func searchBamboo(x: Int, y: Int) -> Int {
    if dp[y][x] != 0 { return dp[y][x] }
    
    dp[y][x] = 1
    
    for direction in directions {
        let nextX = x + direction.0
        let nextY = y + direction.1
        
        if nextX < 0 || nextX >= n || nextY < 0 || nextY >= n { continue }
        let nextBamboo = space[nextY][nextX]
        if nextBamboo <= space[y][x] { continue }
        
        dp[y][x] = max(dp[y][x], searchBamboo(x: nextX, y: nextY) + 1)
    }
    
    return dp[y][x]
}

for i in 0..<n {
    for j in 0..<n {
        result = max(result, searchBamboo(x: j, y: i))
    }
}

print(result)
