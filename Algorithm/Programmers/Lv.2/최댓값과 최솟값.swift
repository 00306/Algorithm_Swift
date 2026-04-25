//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 2/12/25.
//

import Foundation

func solution(_ s: String) -> String {
    let numbers = s.split(separator: " ").map { Int($0)! }
    let min = numbers.min()!
    let max = numbers.max()!
    var answer = "\(min) \(max)"
    return answer
}
