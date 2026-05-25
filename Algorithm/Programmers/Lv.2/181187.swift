//
//  181187.swift
//  Algorithm
//
//  Created by 송지혁 on 5/23/26.
//

import Foundation

func solution(_ r1: Int, _ r2: Int) -> Int64 {
    var firstQuadrant: Int64 = 0
    
    for x in 0...r2 {
        let minY = x <= r1 ? sqrt(Double(r1*r1) - Double(x*x)) : 0
        let maxY = sqrt(Double(r2*r2) - Double(x*x))
        
        if minY != Double(Int64(minY)) {
            firstQuadrant += Int64(maxY) - Int64(minY)
        } else {
            firstQuadrant += Int64(maxY) - Int64(minY) + 1
        }
    }
    
    let onAxis = Int64((r2-r1+1)) * 4
    
    return firstQuadrant * 4 - onAxis
}
