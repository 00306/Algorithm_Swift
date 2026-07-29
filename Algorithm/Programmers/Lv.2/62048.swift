//
//  62048.swift
//  Algorithm
//
//  Created by 송지혁 on 7/29/26.
//

import Foundation

func crossGridCount(width: Int, height: Int) -> Int64 {
    var result: Int64 = 0
    
    for x2 in 1...width {
        let y2 = height * x2 / width
        let x1 = x2 - 1
        let y1 = height * x1 / width
        
        result += 1 + Int64(y2 - y1)
        if height * x2 % width == 0 { result -= 1 }
        
    }
    
    return result
}

func gcd(_ num1: Int, _ num2: Int) -> Int {
    if num2 == 0 { return num1 }
    
    return gcd(num2, num1 % num2)
}

func solution(_ w: Int, _ h: Int) -> Int64 {
    var answer: Int64 = 0
    
    let ratio = gcd(w, h)
    answer = Int64(w * h) - crossGridCount(width: w / ratio, height: h / ratio) * Int64(ratio)
    
    return answer
}
