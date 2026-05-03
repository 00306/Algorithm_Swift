//
//  42883.swift
//  Algorithm
//
//  Created by 송지혁 on 5/3/26.
//

import Foundation

func solution(_ number: String, _ k: Int) -> String {
    var digits = number.map { String($0) }
    var stack: [String] = []
    var currentK = k
    
    for digit in digits {
        
        while let last = stack.last,
                !stack.isEmpty,
                Int(digit)! > Int(last)!,
                currentK > 0 {
            stack.removeLast()
            currentK -= 1
        }
        
        stack.append(digit)
    }
    
    if currentK > 0 { stack.removeLast(currentK) }
    
    return stack.joined()
}
