//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/12/26.
//

let N = Int(readLine()!)!
let oddDirections = [(-1, 0), (1, -1), (1, 1)]
let evenDiretcions = [(-1, -1), (-1, 1), (1, 0)]


var graph = Array(repeating: [Int](repeating: 0, count: 4 * (N+1)), count: 4 * (N+1))
graph[2*N+1][2*N] = 1

func dfs(i: Int, j: Int, n: Int, prevMove: (Int, Int)) -> Int {
    
    
    if n == 0 {
        if graph[i][j] == 1 { return 1 }
        
        return 0
    }
    
    let directions = i % 2 == 0 ? evenDiretcions: oddDirections
    var result = 0
    
    graph[i][j] = 1
    
    for direction in directions {
        if direction == (-prevMove.0, -prevMove.1) { continue }
        
        let nextY = i + direction.0
        let nextX = j + direction.1
        
        if n > 1 && graph[nextY][nextX] == 1 { continue }
        result += dfs(i: nextY, j: nextX, n: n-1, prevMove: direction)
    }
    
    graph[i][j] = 0
    
    return result
}

let result = dfs(i: 2*N, j: 2*N, n: N, prevMove: (-1, 0))

print(result)


