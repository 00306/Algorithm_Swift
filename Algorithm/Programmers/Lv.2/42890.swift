//
//  42890.swift
//  Algorithm
//
//  Created by 송지혁 on 8/3/26.
//

import Foundation

func combination(elements: [Int]) -> [[Int]] {
    var result: [[Int]] = []
    
    func dfs(index: Int, current: [Int]) {
        if index == elements.count {
            if !current.isEmpty {
                result.append(current)
            }
            
            return
        }
        
        dfs(index: index + 1, current: current + [elements[index]])
        dfs(index: index + 1, current: current)
    }
    
    dfs(index: 0, current: [])
    
    return result
}

func isUnique(attribute: [Int], relation: [[String]]) -> Bool {
    var tuples: Set<[String]> = []
    
    for tuple in relation {
        var partial: [String] = []
        for index in attribute {
            partial.append(tuple[index])
        }
        
        tuples.insert(partial)
    }
    
    if tuples.count == relation.count { return true }
    
    return false
}

func solution(_ relation: [[String]]) -> Int {
    let attributes = Array(0..<relation[0].count)
    let combinations = combination(elements: attributes)
    
    var uniques: [[Int]] = []
    
    for attribute in combinations {
        if isUnique(attribute: attribute, relation: relation) {
            uniques.append(attribute)
        }
    }
    
    uniques.sort { $0.count < $1.count }
    
    var superSet: Set<Int> = []
    
    for unique in uniques {
        for i in 0..<uniques.count where !superSet.contains(i) {
            if unique == uniques[i] { continue }
            
            if Set(unique).isSubset(of: Set(uniques[i])) {
                superSet.insert(i)
            }
        }
    }
    
    return uniques.count - superSet.count
}
