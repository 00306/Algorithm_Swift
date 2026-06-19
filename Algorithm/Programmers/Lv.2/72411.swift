//
//  72411.swift
//  Algorithm
//
//  Created by 송지혁 on 6/19/26.
//

import Foundation

func combination(_ elements: [String], scale: [Int]) -> Set<Set<String>> {
    var result: Set<Set<String>> = []
    
    func dfs(_ i: Int, current: Set<String>) {
        for count in scale {
            if current.count == count {
                result.update(with: current)
            }
        }
        
        if i >= elements.count { return }
        
        dfs(i+1, current: current.union([elements[i]]))
        dfs(i+1, current: current)
    }
    
    dfs(0, current: [])
    
    return result
}

func solution(_ orders: [String], _ course: [Int]) -> [String] {
    var courseMap: [Set<String>: Int] = [:]
    var result: [String] = []
    
    for order in orders {
        let combinations = combination(order.map { String($0) }, scale: course)
        
        for c in combinations {
            courseMap[c, default: 0] += 1
        }
    }
    
    for count in course {
        var maxValue = 0
        
        for (key, value) in courseMap {
            if key.count == count, value > maxValue { maxValue = value }
        }
        
        if maxValue == 1 { continue }
        
        courseMap
            .filter { $0.value == maxValue && $0.key.count == count }
            .forEach { result.append($0.key.sorted().joined()) }
    }
    
    
    
    return result.sorted()
}
