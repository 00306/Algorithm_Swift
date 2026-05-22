//
//  181188.swift
//  Algorithm
//
//  Created by 송지혁 on 5/22/26.
//

import Foundation

func solution(_ targets: [[Int]]) -> Int {
    let sortedTargets = targets.sorted(by: { $0[1] < $1[1] })
    var count = 0
    var currentEndTime = 0
    
    for target in sortedTargets {
        let s = target[0]
        let e = target[1]
        
        if s >= currentEndTime {
            count += 1
            currentEndTime = e
        }
    }
    
    return count
}
