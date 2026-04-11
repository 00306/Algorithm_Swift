//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/11/26.
//

typealias RoomInfo = (type: Character, cost: Int, neighbors: [Int])

var results: [Int] = []

while true {
    let n = Int(readLine()!)!
    
    if n == 0 { break }
    
    var graph: [Int: RoomInfo] = [:]
    var memo: [[Int]] = Array(repeating: [Int](repeating: 0, count: 501), count: n+1)
    
    for i in 1..<n+1 {
        let roomInfo = readLine()!.split(separator: " ").map { String($0) }
        
        let type = Character(roomInfo[0])
        let cost = Int(roomInfo[1])!
        let neighbors = Array(roomInfo[2...].map { Int($0)! }.dropLast())
        
        graph[i] = RoomInfo(type, cost, neighbors)
    }
    
    
    func dfs(index: Int, cash: Int) -> Int {
        let currentRoomInfo = graph[index]!
        
        if memo[index][cash] != 0 { return memo[index][cash] }
        
        memo[index][cash] = -1
        
        let type = currentRoomInfo.type
        let neighbors = currentRoomInfo.neighbors
        var newCash = cash
        
        if type == "L" {
            newCash = max(currentRoomInfo.cost, newCash)
        } else if type == "T" {
            newCash -= currentRoomInfo.cost
        }
        
        if newCash < 0 {
            memo[index][cash] = 2
            return 2
        }
        
        if index == n {
            memo[index][cash] = 1
            return 1
        }
        
        for neighbor in neighbors {
            if memo[neighbor][newCash] == -1 { continue }
            
            let result = dfs(index: neighbor, cash: newCash)

            
            if result == 1 {
                memo[index][cash] = 1
                return 1
            }
        }
        
        memo[index][cash] = 2
        return 2
    }
    
    results.append(dfs(index: 1, cash: 0))
}


for result in results {
    print(result == 1 ? "Yes" : "No")
}
