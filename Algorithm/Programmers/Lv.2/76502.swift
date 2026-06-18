//
//  76502.swift
//  Algorithm
//
//  Created by 송지혁 on 6/18/26.
//

import Foundation

func leftRotate(s: [String], amount: Int) -> [String] {
    var rotatedString: [String] = Array(repeating: "", count: s.count)
    
    for i in 0..<s.count {
        if i - amount < 0 {
            rotatedString[s.count-amount+i] = s[i]
        } else {
            rotatedString[i-amount] = s[i]
        }
    }
    
    return rotatedString
}

func checkCorrectBracket(_ s: [String]) -> Bool {
    var stack: [String] = []
    
    for i in 0..<s.count {
        if s[i] == "]" {
            guard let last = stack.popLast() else { return false }
            if last != "[" { return false }
            
        } else if s[i] == "}" {
            guard let last = stack.popLast() else { return false }
            if last != "{" { return false }
            
        } else if s[i] == ")" {
            guard let last = stack.popLast() else { return false }
            if last != "(" { return false }
            
        } else {
            stack.append(s[i])
        }
    }
    
    if !stack.isEmpty { return false }
    
    return true
}

func solution(_ s: String) -> Int {
    let sArray = s.map { String($0) }
    var result = 0
    
    for i in 0..<s.count {
        let rotatedS = leftRotate(s: sArray, amount: i)
        if checkCorrectBracket(rotatedS) { result += 1 }
    }
    
    return result
}
