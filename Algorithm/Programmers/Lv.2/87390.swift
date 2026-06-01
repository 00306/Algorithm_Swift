//
//  87390.swift
//  Algorithm
//
//  Created by 송지혁 on 6/1/26.
//

import Foundation

func findNumber(_ n: Int, _ index: Int) -> Int {
    let row = index / n
    let column = index % n
    
    if column <= row { return row + 1 }
    
    return column + 1
}

func solution(_ n: Int, _ left: Int64, _ right: Int64) -> [Int] {
    var result: [Int] = []
    
    for index in left...right {
        result.append(findNumber(n, Int(index)))
    }
    
    return result
}
