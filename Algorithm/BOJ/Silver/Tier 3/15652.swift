//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 5/24/24.
//

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let m = input[1]
var visited = Array(repeating: false, count: n+1)
var result = ""

dfs([])

func dfs(_ array: [Int]) {
    if array.count == m {
        result += array.map { String($0) }.joined(separator: " ")
        result += "\n"
        return
    }
    
    for i in (array.last ?? 1)...n {
        if !visited[i] {
            dfs(array + [i])
        }
}


}

print(result)
