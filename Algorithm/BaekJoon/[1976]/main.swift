//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 12/17/24.
//

let n = Int(readLine()!)!
let m = Int(readLine()!)!
var parents = [Int](0..<n)
var ranks = Array(repeating: 1, count: n)
var result = true

func find(_ x: Int) -> Int {
    if parents[x] != x { parents[x] = find(parents[x]) }
    
    return parents[x]
}

func union(_ x: Int, _ y: Int) {
    let rootX = find(x)
    let rootY = find(y)
    
    if rootX == rootY { return }
    
    if ranks[rootX] > ranks[rootY] {
        parents[rootY] = rootX
    } else if ranks[rootX] < ranks[rootY] {
        parents[rootX] = rootY
    } else {
        parents[rootY] = rootX
        ranks[rootX] += 1
    }
}

for i in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    
    for j in 0..<n {
        if input[j] == 1 { union(i, j) }
    }
}

let plan = readLine()!.split(separator: " ").map { Int($0)! }

var repNode = find(plan[0]-1)

for city in plan {
    if repNode != find(city-1) {
        result = false
        break
    }
}

print(result ? "YES" : "NO")
