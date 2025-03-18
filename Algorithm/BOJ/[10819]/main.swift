//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 2/22/25.
//

let n = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").map { Int($0)! }
var result = Int.min
var visited = Array(repeating: false, count: n)
var array: [Int] = []

func dfs(depth: Int) {
    if depth == n {
        var sum = 0
        for i in 0..<n-1 {
            sum += abs(array[i] - array[i+1])
        }
        
        result = max(result, sum)
        return
    }
    
    for i in 0..<n {
        if visited[i] { continue }
        visited[i] = true
        array.append(numbers[i])
        dfs(depth: depth + 1)
        
        visited[i] = false
        array.removeLast()
    }
}

dfs(depth: 0)

print(result)
