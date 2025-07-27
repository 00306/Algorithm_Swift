//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 7/27/25.
//

let N = Int(readLine()!)!
var dp = Array(repeating: 0, count: N+1)


for i in 1..<N+1 {
    let task = readLine()!.split(separator: " ").map { Int($0)! }
    let time = task[0]
    let precedeWorks = task[1]
    
    if precedeWorks == 0 {
        dp[i] = time
        continue
    }
    
    var maxWorkTime = Int.min
    
    for work in task[2...] {
        if dp[work] > maxWorkTime {
            maxWorkTime = dp[work]
        }
    }
    
    dp[i] = maxWorkTime + time
    
}

print(dp.max()!)
