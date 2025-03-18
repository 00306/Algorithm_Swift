//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 7/14/24.
//

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let m = input[1]
var graph = [[Int]]()
var chickenCoordinates: [(Int, Int)] = []
var houseCoordinates: [(Int, Int)] = []

var distances: [Int] = []

for _ in 0..<n {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    graph.append(line)
}

for i in 0..<n {
    for j in 0..<n {
        if graph[i][j] == 2 {
            chickenCoordinates.append((i, j))
        } else if graph[i][j] == 1 {
            houseCoordinates.append((i, j))
        }
    }
}

func dfs(start: Int, chickenHouses: [(Int, Int)]) {
    if chickenHouses.count > m { return }
    var distance = Int.max
    var minDistance = 0
    
    for houseCoordinate in houseCoordinates {
        distance = Int.max
        
        for chickenHouse in chickenHouses {
            distance = min(distance, abs(chickenHouse.0 - houseCoordinate.0) + abs(chickenHouse.1 - houseCoordinate.1))
        }
        
        if distance != Int.max {
            minDistance += distance
        }
    }
    
    distances.append(minDistance)
    
    
    for i in start..<chickenCoordinates.count {
        dfs(start: i+1, chickenHouses: chickenHouses + [chickenCoordinates[i]])
    }
    
    
}

dfs(start: 0, chickenHouses: [])


print(distances[1...].min()!)
