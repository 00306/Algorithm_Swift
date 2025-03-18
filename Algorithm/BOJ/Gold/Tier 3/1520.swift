//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 8/26/24.
//

let MN = readLine()!.split(separator: " ").map { Int($0)! }
let m = MN[0]
let n = MN[1]
let directions = [(-1, 0), (1, 0), (0, -1), (0, 1)]
var map: [[Int]] = []
var dp = Array(repeating: Array(repeating: -1, count: n), count: m)
var result = 0


for _ in 0..<m {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    map.append(line)
}

func dfs(current: (Int, Int)) -> Int {
    let x = current.1
    let y = current.0
    if y == m-1 && x == n-1 { return 1 }
    if dp[y][x] != -1 { return dp[y][x] }
    
    dp[y][x] = 0
    let currentHeight = map[y][x]
    
    for direction in directions {
        let nextX = x + direction.1
        let nextY = y + direction.0
        
        if nextX < 0 || nextX >= n || nextY < 0 || nextY >= m || map[nextY][nextX] >= currentHeight { continue }
        dp[y][x] += dfs(current: (nextY, nextX))
    }
    
    return dp[y][x]
}

result = dfs(current: (0, 0))
print(result)
