//
//  타겟넘버.swift
//  Algorithm
//
//  Created by 송지혁 on 4/24/26.
//

import Foundation

func solution(_ numbers:[Int], _ target:Int) -> Int {
    var count = 0
    
    func dfs(i: Int, sum: Int) {
        if i == numbers.count - 1 {
            if sum == target { count += 1 }
            return
        }
        
        dfs(i: i+1, sum: sum + numbers[i+1])
        dfs(i: i+1, sum: sum - numbers[i+1])
        
    }
    
    dfs(i: 0, sum: numbers[0])
    dfs(i: 0, sum: -numbers[0])
    
    return count
}


