//
//  150368.swift
//  Algorithm
//
//  Created by 송지혁 on 5/27/26.
//

import Foundation

func permutation(elements: [Int], count: Int) -> [[Int]] {
    var result: [[Int]] = []
    
    func dfs(current: [Int]) {
        if current.count == count {
            result.append(current)
            return
        }
        
        for element in elements {
            dfs(current: current + [element])
        }
    }
    
    dfs(current: [])
    
    return result
}

func solution(_ users: [[Int]], _ emoticons: [Int]) -> [Int] {
    let discounts = [10, 20, 30, 40]
    let allCases = permutation(elements: discounts, count: emoticons.count)
    
    var result = [0, 0]
    
    for rates in allCases {
        var totalPrice = 0
        var subscribes = 0
        
        for user in users {
            var sum = 0
            for j in 0..<emoticons.count {
                if user[0] <= rates[j] {
                    sum += emoticons[j] * (100 - rates[j]) / 100
                }
            }
            if user[1] <= sum {
                subscribes += 1
            } else {
                totalPrice += sum
            }
        }
        
        if subscribes > result[0] ||
            (subscribes == result[0] && totalPrice > result[1]) {
            result = [subscribes, totalPrice]
        }
    }
    
    return result
}
