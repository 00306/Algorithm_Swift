//
//  68645.swift
//  Algorithm
//
//  Created by 송지혁 on 7/25/26.
//

import Foundation

func transform(_ x: Int, _ y: Int) -> Int {
    return (y*(y+1))/2 + x
}

func solution(_ n: Int) -> [Int] {
    var result = [Int](repeating: 0, count: (n*(n+1))/2)
    
    func travel(x: Int, y: Int, number: Int, _ n: Int) {
        if n < 1 { return }
        
        result[transform(x, y)] = number
        
        if n == 1 { return }
        
        var currentX = x
        var currentY = y
        var currentNumber = number+1
        
        // 1 phase
        for _ in 0..<n-1 {
            currentY += 1
            result[transform(currentX, currentY)] = currentNumber
            currentNumber += 1
        }
        
        // 2 phase
        for _ in 0..<n-1 {
            currentX += 1
            result[transform(currentX, currentY)] = currentNumber
            currentNumber += 1
        }
        
        // 3 phase
        
        for _ in 0..<n-2 {
            currentX -= 1
            currentY -= 1
            result[transform(currentX, currentY)] = currentNumber
            currentNumber += 1
        }
        
        travel(x: currentX, y: currentY+1, number: currentNumber, n-3)
    }
    
    travel(x: 0, y: 0, number: 1, n)
    
    return result
}
