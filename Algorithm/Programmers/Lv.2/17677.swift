//
//  17677.swift
//  Algorithm
//
//  Created by 송지혁 on 8/21/26.
//

import Foundation

func solution(_ str1: String, _ str2: String) -> Int {
    var aDictionary: [String: Int] = [:]
    var bDictionary: [String: Int] = [:]
    let str1Array = str1.map { String($0) }
    let str2Array = str2.map { String($0) }
    
    for i in 0..<str1Array.count-1 {
        if !str1Array[i].allSatisfy { $0.isLetter } || !str1Array[i+1].allSatisfy { $0.isLetter } { continue }
        
        let element = str1Array[i].uppercased() + str1Array[i+1].uppercased()
        aDictionary[element, default: 0] += 1
    }
    
    for i in 0..<str2Array.count-1 {
        if !str2Array[i].allSatisfy { $0.isLetter } || !str2Array[i+1].allSatisfy { $0.isLetter } { continue }
        let element = str2Array[i].uppercased() + str2Array[i+1].uppercased()
        bDictionary[element, default: 0] += 1
    }
    
    var intersection = 0
    
    for (aKey, aValue) in aDictionary {
        if let bValue = bDictionary[aKey] {
            intersection += min(aValue, bValue)
        }
    }
    
    var union = 0
    
    for (aKey, aValue) in aDictionary {
        if let bValue = bDictionary[aKey] {
            union += max(aValue, bValue)
        } else {
            union += aValue
        }
    }
    
    for (bKey, bValue) in bDictionary {
        if let aValue = aDictionary[bKey] { continue }
        union += bValue
    }
    
    print(aDictionary, bDictionary, intersection, union)
    
    if union == 0, intersection == 0 { return 65536 }
    
    return Int(65536 * Double(intersection) / Double(union))
}
