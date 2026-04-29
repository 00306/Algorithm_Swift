//
//  43164.swift
//  Algorithm
//
//  Created by 송지혁 on 4/29/26.
//

import Foundation

func solution(_ tickets: [[String]]) -> [String] {
    let airports = Set(tickets.flatMap { $0 })
    var airportsToIndexDict: [String: Int] = [:]
    var indexToAirportsDict: [Int: String] = [:]
    
    var remainingTickets = Array(repeating: [Int](repeating: 0, count: airports.count), count: airports.count)
    
    for (index, name) in airports.enumerated() {
        airportsToIndexDict[name] = index
        indexToAirportsDict[index] = name
    }
    
    var graph: [Int: [Int]] = [:]
    var result: [String] = []
    
    for ticket in tickets {
        let start = airportsToIndexDict[ticket[0]]!
        let arrival = airportsToIndexDict[ticket[1]]!
        
        remainingTickets[start][arrival] += 1
        
        graph[start, default: []].append(arrival)
    }
    
    func dfs(node: String, path: [String]) {
        let startNodeNumber = airportsToIndexDict[node]!
        var end = true
        
        for arrivalNodeNumber in graph[startNodeNumber, default: []] {
            if remainingTickets[startNodeNumber][arrivalNodeNumber] < 1 { continue }
            remainingTickets[startNodeNumber][arrivalNodeNumber] -= 1
            
            end = false
            
            let nextStart = indexToAirportsDict[arrivalNodeNumber]!
            
            dfs(node: nextStart, path: path + [nextStart])
            
            remainingTickets[startNodeNumber][arrivalNodeNumber] += 1
            
        }
        
        if end && path.count == tickets.count+1 {
            if result.isEmpty {
                result = path
            } else {
                for i in 0..<result.count {
                    if result[i] < path[i] { break }
                    
                    if result[i] > path[i] {
                        result = path
                        break
                    }
                }
            }
        }
    }
    
    dfs(node: "ICN", path: ["ICN"])
    
    return result
}
