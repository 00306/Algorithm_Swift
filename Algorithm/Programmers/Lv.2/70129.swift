//
//  70129.swift
//  Algorithm
//
//  Created by 송지혁 on 6/29/26.
//

import Foundation

func solution(_ s: String) -> [Int] {
    var currentBinary = s
    var count = 0
    var erasedZeroCount = 0
    
    while currentBinary != "1" {
        var zeroErasedBinary = ""
        
        for char in currentBinary.map { String($0) } {
            if char == "0" { continue }
            zeroErasedBinary += char
        }
        
        var binaryCount = zeroErasedBinary.count
        var newBinary: [String] = []
        while binaryCount > 0 {
            newBinary.append(String(binaryCount % 2))
            binaryCount /= 2
        }
        
        erasedZeroCount += currentBinary.count - zeroErasedBinary.count
        count += 1
        currentBinary = newBinary.reversed().joined()
    }
    
    return [count, erasedZeroCount]
}
