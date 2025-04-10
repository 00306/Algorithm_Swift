//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/10/25.
//

let ABC = readLine()!.split(separator: " ").map { Int($0)! }
let A = ABC[0]
let B = ABC[1]
let C = ABC[2]

var result: [Int] = []
var visited = Array(repeating: Array(repeating: false, count: C+1), count: B+1)

func dfs(a: Int, b: Int, c: Int) {
    if visited[b][c] { return }
    visited[b][c] = true
    
    if b + c == C { result.append(c) }
    
    // a -> b
    let amountAtoB = min((B-b), a)
    dfs(a: a - amountAtoB, b: b + amountAtoB, c: c)
    
    //a->c
    dfs(a: 0, b: b, c: a+c)
    //b -> a
    let amountBtoA = min((A-a), b)
    dfs(a: a + amountBtoA, b: b - amountBtoA, c: c)
    
    //b -> c
    dfs(a: a, b: 0, c: b+c)
    
    //c->a
    let amountCtoA = min((A-a), c)
    dfs(a: a + amountCtoA, b: b, c: c - amountCtoA)
    
    //c->b
    let amountCtoB = min((B-b), c)
    dfs(a: a, b: b + amountCtoB, c: c - amountCtoB)
}

dfs(a: 0, b: 0, c: C)

result.sorted().forEach { print($0, terminator: " ")}
