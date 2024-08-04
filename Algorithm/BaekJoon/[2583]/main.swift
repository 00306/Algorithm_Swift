//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 8/25/24.
//


let MNK = readLine()!.split(separator: " ").map { Int($0)! }
let m = MNK[0]
let n = MNK[1]
let k = MNK[2]
var count = 0
var extends: [Int] = []
var extend = 0
let directions: [(Int, Int)] = [(0, 1), (0, -1), (-1, 0), (1, 0)]

var map = Array(repeating: Array(repeating: false, count: n), count: m)

for _ in 0..<k {
    let coordinate = readLine()!.split(separator: " ").map { Int($0)! }
    let left = (coordinate[1], coordinate[0])
    let right = (coordinate[3], coordinate[2])
    
    for i in left.0..<right.0 {
        for j in left.1..<right.1 {
            map[i][j] = true
        }
    }
}

func dfs(start: (Int, Int)) {
    let x = start.1
    let y = start.0
    
    if y < 0 || y >= m || x < 0 || x >= n || map[y][x] { return }
    map[y][x] = true
    extend += 1
    
    for direction in directions {
        dfs(start: (y + direction.0, x + direction.1))
    }
}


for i in 0..<m {
    for j in 0..<n {
        if map[i][j] { continue }
        count += 1
        dfs(start: (i, j))
        extends.append(extend)
        extend = 0
    }
}


print(count)
extends.sorted().forEach { print($0, terminator: " ") }
