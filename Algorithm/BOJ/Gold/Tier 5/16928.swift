//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 3/11/25.
//

let dice = [1, 2, 3, 4, 5, 6]
let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0]
let m = nm[1]
var ladders = Array(repeating: 0, count: 101)
var snakes = Array(repeating: 0, count: 101)
var result = Int.max
var visited = Array(repeating: false, count: 101)

for _ in 0..<n {
    let ladder = readLine()!.split(separator: " ").map { Int($0)! }
    ladders[ladder[0]] = ladder[1]
}

for _ in 0..<m {
    let snake = readLine()!.split(separator: " ").map { Int($0)! }
    snakes[snake[0]] = snake[1]
}

var needVisitQueue: [(current: Int, count: Int)] = [(1, 0)]

while !needVisitQueue.isEmpty {
    let square = needVisitQueue.removeFirst()
    
    if square.current == 100 {
        result = square.count
        break
    }
    
    if visited[square.current] { continue }
    
    visited[square.current] = true
    
    let candidates = dice.map { $0 + square.current }
    var next: [(current: Int, count: Int)] = []
    
    for i in 0..<candidates.count where candidates[i] <= 100 {
        let candidate = candidates[i]
        
        if ladders[candidate] != 0 {
            next.append((ladders[candidate], square.count + 1))
        } else if snakes[candidate] != 0 {
            next.append((snakes[candidate], square.count + 1))
        } else {
            next.append((candidate, square.count + 1))
        }
    }
    
    next.sort(by: { $0.current > $1.current })
    needVisitQueue += next
    
}

print(result)
