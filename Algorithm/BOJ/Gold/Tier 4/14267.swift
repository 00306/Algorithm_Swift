//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/5/26.
//

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0]
let m = nm[1]

let bossIndex = readLine()!.split(separator: " ").map { Int($0)! }
var graph: [Int: [Int]] = [:]


for (i, boss) in bossIndex.enumerated() {
    let index = i+1
    graph[boss, default: []].append(index)
}

var compliments = [Int](repeating: 0, count: n+1)
var cumulativeCompliments = [Int](repeating: 0, count: n+1)


for _ in 0..<m {
    let iw = readLine()!.split(separator: " ").map { Int($0)! }
    let i = iw[0]
    let w = iw[1]
    
    compliments[i] += w
    
    
}

func broadcastCompliment(currentIndex: Int, amountOfCompliment: Int) {
    let cumulativeCompliment = amountOfCompliment + compliments[currentIndex]
    cumulativeCompliments[currentIndex] += cumulativeCompliment
    
    for child in graph[currentIndex, default: []] {
        broadcastCompliment(currentIndex: child, amountOfCompliment: cumulativeCompliment)
    }
    
    
}

broadcastCompliment(currentIndex: 1, amountOfCompliment: 0)

cumulativeCompliments[1...].forEach { print($0, terminator: " ") }
