//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 8/8/24.
//

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0]
let m = nm[1]

let sequence = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
var result = ""

func dfs(start: Int, array: [Int]) {
    if array.count == m {
        array.forEach { result += "\($0) " }
        result += "\n"
        return
    }
    
    for i in start..<n where !array.contains(sequence[i]) {
        dfs(start: start, array: array + [sequence[i]])
    }
}

dfs(start: 0, array: [])
print(result)
