//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/29/25.
//

let NM = readLine()!.split(separator: " ").map { Int($0)! }
let N = NM[0]
let M = NM[1]

let directions = [(0, 1), (0, -1), (1, 0), (-1, 0)]

var graph = Array(repeating: [Int](), count: N)
var areaID = Array(repeating: [Int](repeating: 1, count: M), count: N)
var visited = Array(repeating: [Bool](repeating: false, count: M), count: N)
var answer = Array(repeating: [Int](repeating: 0, count: M), count: N)
var result = ""



var currentAreaID = 2
var areaSizeDict: [Int: Int] = [:]

for i in 0..<N {
    let line = readLine()!.map { Int(String($0))! }
    graph[i] = line
}

func dfs(x: Int, y: Int) -> Int {
    visited[y][x] = true
    areaID[y][x] = currentAreaID
    
    var answer = 1
    
    for direction in directions {
        let nextX = x + direction.1
        let nextY = y + direction.0
        
        if nextX < 0 || nextX >= M || nextY < 0 || nextY >= N { continue }
        if visited[nextY][nextX] { continue }
        if graph[nextY][nextX] == 1 { continue }
        
        answer += dfs(x: nextX, y: nextY)
    }
    
    return answer
}

func calculateAreaSize(areas: Set<Int>) -> Int {
    var totalSize = 1
    
    for area in areas {
        let areaSize = areaSizeDict[area]!
        totalSize += areaSize
    }
    
    return totalSize
}

for i in 0..<N {
    for j in 0..<M where graph[i][j] == 0 {
        if visited[i][j] { continue }
        areaSizeDict[currentAreaID, default: 0] = dfs(x: j, y: i)
        currentAreaID += 1
    }
}

for i in 0..<N {
    for j in 0..<M where graph[i][j] == 1 {
        var adjacentAreas = Set<Int>()
        
        for direction in directions {
            let nextX = j + direction.1
            let nextY = i + direction.0
            
            if nextX < 0 || nextX >= M || nextY < 0 || nextY >= N { continue }
            if graph[nextY][nextX] == 0 {
                adjacentAreas.insert(areaID[nextY][nextX])
            }
        }   
        
        answer[i][j] = calculateAreaSize(areas: adjacentAreas) % 10
    }
    
    result += "\(answer[i].map { String($0) }.joined(separator: ""))\n"
}



print(result)

