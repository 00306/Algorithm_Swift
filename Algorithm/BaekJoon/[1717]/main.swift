//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 12/16/24.
//



let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let m = input[1]
var result = ""
var parents = [Int](0...n)
var ranks = Array(repeating: 1, count: n+1)

func find(_ a: Int) -> Int {
    if parents[a] != a { parents[a] = find(parents[a]) }
    return parents[a]
}

func union(_ a: Int, _ b: Int) {
    let rootA = find(a)
    let rootB = find(b)
    
    
    if ranks[rootA] > ranks[rootA] {
        parents[rootB] = rootA
    } else if ranks[rootA] < ranks[rootB] {
        parents[rootA] = rootB
    } else {
        parents[rootB] = rootA
        ranks[rootA] += 1
    }
}

for _ in 0..<m {
    let order = readLine()!.split(separator: " ").map { Int($0)! }
    if order[0] == 0 {
        union(order[1], order[2])
    } else if order[0] == 1 {
        result += find(order[1]) == find(order[2]) ? "YES\n" : "NO\n"
    }
}

print(result)
