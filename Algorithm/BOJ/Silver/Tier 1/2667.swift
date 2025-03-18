//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 6/24/24.
//

let n = Int(readLine()!)!
var map: [[Int]] = []
var count = 0
var complex: [Int] = []
var result = ""

for _ in 0..<n {
    let input = readLine()!.map { Int(String($0))! }
    map.append(input)
}

func dfs(x: Int, y: Int) {
    if x < 0 || y < 0 || x >= n || y >= n || map[x][y] == 0 { return }
    count += 1
    map[x][y] = 0
    
    dfs(x: x-1, y: y)
    dfs(x: x+1, y: y)
    dfs(x: x, y: y-1)
    dfs(x: x, y: y+1)
}

for i in 0..<n {
    for j in 0..<n {
        if map[i][j] == 1 {
            dfs(x: i, y: j)
            complex.append(count)
            count = 0
        }
    }
}

complex.sort()
result += "\(complex.count)\n"
complex.forEach { result += "\($0)\n" }

print(result)

