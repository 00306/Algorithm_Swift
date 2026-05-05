//
//  42862.swift
//  Algorithm
//
//  Created by 송지혁 on 5/5/26.
//

import Foundation

func solution(_ n: Int, _ lost: [Int], _ reserve: [Int]) -> Int {
    var state = Array(repeating: 1, count: n+1)
    
    for student in lost {
        state[student] -= 1
    }
    
    for student in reserve {
        state[student] += 1
    }
    
    for student in reserve.sorted() {
        if state[student] == 1 { continue }
        
        if state[student-1] == 0 {
            state[student-1] += 1
            state[student] -= 1
        } else if student+1 <= n, state[student+1] == 0 {
            state[student+1] += 1
            state[student] -= 1
        }
    }
    
    return state[1...].filter { $0 > 0 }.count
}
