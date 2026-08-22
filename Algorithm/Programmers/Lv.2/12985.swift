//
//  12985.swift
//  Algorithm
//
//  Created by 송지혁 on 8/22/26.
//

import Foundation

func solution(_ n: Int, _ a: Int, _ b: Int) -> Int {
    var answer = 1
    var aNumber = a
    var bNumber = b
    while aNumber > 0 && bNumber > 0 {
        if aNumber % 2 == 0, bNumber % 2 == 1, aNumber - bNumber == 1 { break }
        if bNumber % 2 == 0, aNumber % 2 == 1, bNumber - aNumber == 1 { break }
        
        aNumber = aNumber % 2 == 1 ? aNumber / 2 + 1 : aNumber / 2
        bNumber = bNumber % 2 == 1 ? bNumber / 2 + 1 : bNumber / 2
        answer += 1
        
        
    }
    
    return answer
}
