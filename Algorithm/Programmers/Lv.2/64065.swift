//
//  64065.swift
//  Algorithm
//
//  Created by 송지혁 on 7/28/26.
//

import Foundation

func solution(_ s: String) -> [Int] {
    let expression = s.map { String($0) }[1...s.count-2]
    var tupleSets: [[Int]] = []
    
    var stack: [String] = []
    
    for string in expression {
        if string == "}" {
            var elements = ""
            
            while let last = stack.popLast() {
                if last == "{" {
                    let tupleSet = String(elements.reversed()).split(separator: ",").map { Int($0)! }
                    tupleSets.append(tupleSet)
                    break
                    
                } else { elements += last }
            }
        } else { stack.append(string) }
    }
    
    tupleSets.sort { $0.count < $1.count }
    
    var result: [Int] = []
    var existNumbers: Set<Int> = []
    
    for tupleSet in tupleSets {
        for number in tupleSet {
            if existNumbers.contains(number) { continue }
            existNumbers.insert(number)
            result.append(number)
        }
    }
    
    return result
}
