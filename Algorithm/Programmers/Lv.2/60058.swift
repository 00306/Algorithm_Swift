//
//  60058.swift
//  Algorithm
//
//  Created by 송지혁 on 7/30/26.
//

import Foundation

func isRightString(_ u: String) -> Bool {
    let uArray = u.map { String($0) }
    var stack: [String] = []
    
    for brace in uArray {
        if brace == ")" {
            if stack.popLast() == nil { return false }
        } else { stack.append(brace) }
    }
    
    return true
}

func seperateBalancedString(_ p: String) -> (String, String) {
    let pArray = p.map { String($0) }
    var u = ""
    var prefixCount = 0
    var postfixCount = 0
    
    for string in pArray {
        if string == "(" {
            prefixCount += 1
        } else if string == ")" {
            postfixCount += 1
        }
        
        u += string
        
        if prefixCount == postfixCount { break }
    }
    
    let v = Array(pArray[u.count...]).joined()
    
    return (u, v)
}

func solution(_ p: String) -> String {
    if p.isEmpty { return p }
    
    let (u, v) = seperateBalancedString(p)
    
    if isRightString(u) {
        return u + solution(v)
    }
    
    var tempString = "("
    tempString += solution(v)
    tempString += ")"
    
    let trimmedU = u.map { String($0) }[1..<u.count-1]
    var reversedU = ""
    
    for brace in trimmedU {
        if brace == "(" { reversedU.append(")") }
        else { reversedU.append("(") }
    }
    
    return tempString + reversedU
}
