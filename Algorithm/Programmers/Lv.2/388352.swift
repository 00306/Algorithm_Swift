//
//  388352.swift
//  Algorithm
//
//  Created by 송지혁 on 5/19/26.
//

import Foundation

func combination(_ start: Int, _ end: Int, _ limit: Int) -> [[Int]] {
    var combinations: [[Int]] = []
    
    func dfs(_ start: Int, _ combination: [Int]) {
        if combination.count == limit {
            combinations.append(combination)
            return
        }
        
        if start <= end {
            dfs(start+1, combination)
            dfs(start+1, combination + [start])
        }
        
    }
    
    dfs(start, [])
    
    return combinations
}

func solution(_ n: Int, _ q: [[Int]], _ ans: [Int]) -> Int {
    var combinations: [[Int]] = combination(1, n, 5)
    var secretCodes: [[Int]] = []
    
    for numbers in combinations {
        var isValid = true
        
        for i in 0..<q.count {
            let submission = q[i]
            let answer = ans[i]
            var count = 0
            
            for i in 0..<numbers.count {
                for j in 0..<submission.count {
                    if numbers[i] == submission[j] {
                        count += 1
                        break
                    }
                }
            }
            
            if answer != count {
                isValid = false
                break
            }
        }
        
        if isValid {
            secretCodes.append(numbers)
        }
    }
    
    return secretCodes.count
}
