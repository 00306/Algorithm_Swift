//
//  68936.swift
//  Algorithm
//
//  Created by 송지혁 on 7/24/26.
//

import Foundation

func recursion(x: Int, y: Int, size: Int, arr: [[Int]]) -> [Int] {
    let base = arr[y][x]
    
    var result = [Int](repeating: 0, count: 2)
    if size == 1 {
        result[base] += 1
        return result
    }
    
    for i in y..<y+size {
        for j in x..<x+size {
            if arr[i][j] != base {
                let secondQuadrant = recursion(x: x, y: y, size: size / 2, arr: arr)
                let firstQuadrant = recursion(x: x+(size/2), y: y, size: size / 2, arr: arr)
                let thridQuadrant = recursion(x: x, y: y+(size/2), size: size / 2, arr: arr)
                let fourthQuadrant = recursion(x: x+(size/2), y: y+(size/2), size: size / 2, arr: arr)
                
                for quadrant in [secondQuadrant, firstQuadrant, thridQuadrant, fourthQuadrant] {
                    result[0] += quadrant[0]
                    result[1] += quadrant[1]
                }
                
                return result
            }
        }
    }
    
    result[base] += 1
    return result
}

func solution(_ arr: [[Int]]) -> [Int] {
    let length = arr.count
    
    return recursion(x: 0, y: 0, size: length, arr: arr)
}
