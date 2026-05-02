//
//  42860.swift
//  Algorithm
//
//  Created by 송지혁 on 5/2/26.
//

import Foundation

func solution(_ name: String) -> Int {
    let nameArray = Array(name)
    let move = name.count - 1
    
    var result = Int.max
    
    for i in 0..<nameArray.count {
        var next = i+1
        
        while next < nameArray.count, nameArray[next] == "A" {
            next += 1
        }
        
        let minMove = min(move,
                          i*2 + nameArray.count - next,
                          i + 2 * (nameArray.count - next))
        
        result = min(result, minMove)
    }
    
    for char in nameArray {
        let order = Int(char.asciiValue!) - 65
        
        result += min(order, 26 - order)
    }
    
    return result
}
