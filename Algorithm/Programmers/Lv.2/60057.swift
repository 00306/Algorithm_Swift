//
//  60057.swift
//  Algorithm
//
//  Created by 송지혁 on 7/31/26.
//

import Foundation

func compressString (unitSize: Int, _ s: String) -> String {
    let sArray = s.map { String($0) }
    var pointer = 0
    var currentUnit = ""
    var duplicateCount = 1
    var result = ""
    
    while unitSize + pointer <= s.count {
        let unit = sArray[pointer..<pointer+unitSize].joined()
        
        if unit == currentUnit {
            duplicateCount += 1
        } else {
            if duplicateCount < 2 {
                result += currentUnit
            } else {
                result += String(duplicateCount) + currentUnit
            }
            
            duplicateCount = 1
        }
        
        currentUnit = unit
        pointer += unitSize
    }
    
    if duplicateCount < 2 {
        result += currentUnit
    } else {
        result += String(duplicateCount) + currentUnit
    }
    
    if pointer < s.count {
        result += sArray[pointer...].joined()
    }
    
    return result
}

func solution(_ s: String) -> Int {
    var result = s.count
    
    for size in 1...s.count {
        let compressed = compressString(unitSize: size, s)
        result = min(result, compressed.count)
    }
    
    return result
}
