//
//  77885.swift
//  Algorithm
//
//  Created by 송지혁 on 6/5/26.
//

func solution(_ numbers: [Int64]) -> [Int64] {
    var results: [Int64] = []
    
    for number in numbers {
        if number % 2 == 0 {
            results.append(number+1)
        } else {
            let digit = (~number).trailingZeroBitCount
            results.append(number + Int64(1 << (digit-1)))
        }
    }
    
    return results
}
