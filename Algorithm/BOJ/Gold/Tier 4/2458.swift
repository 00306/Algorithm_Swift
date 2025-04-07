//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/7/25.
//

import Foundation

let NM = readLine()!.split(separator: " ").map { Int($0)! }
let N = NM[0]
let M = NM[1]

var result = 0

var shortDirectionConnections = Array(repeating: [Int](), count: N+1)
var longDirectionConnections = Array(repeating: [Int](), count: N+1)
var visited = Array(repeating: false, count: N+1)

for _ in 0..<M {
    let connection = readLine()!.split(separator: " ").map { Int($0)! }
    let shorter = connection[0]
    let longer = connection[1]
    
    longDirectionConnections[shorter].append(longer)
    shortDirectionConnections[longer].append(shorter)
}

func findShortStudent(node: Int) -> [Int] {
    visited[node] = true
    if shortDirectionConnections[node].isEmpty {
        return [node]
    }

    var result: [Int] = [node]
    
    for nextNode in shortDirectionConnections[node] {
        if visited[nextNode] { continue }
        result += findShortStudent(node: nextNode)
    }
    
    return result
}

func findLongStudent(node: Int) -> [Int] {
    visited[node] = true
    if longDirectionConnections[node].isEmpty {
        return [node]
    }
    
    var result: [Int] = [node]
    
    for nextNode in longDirectionConnections[node] {
        if visited[nextNode] { continue }
        result += findLongStudent(node: nextNode)
    }
    
    return result
}

for i in 1...N {
    visited = Array(repeating: false, count: N+1)
    let shortStudents = findShortStudent(node: i)
    visited = Array(repeating: false, count: N+1)
    let longStudents = findLongStudent(node: i)
    
    if (shortStudents + longStudents).count-1 == N {
        result += 1
    }
}

print(result)
