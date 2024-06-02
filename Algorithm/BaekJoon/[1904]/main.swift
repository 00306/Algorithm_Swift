//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 6/2/24.
//

let n = Int(readLine()!)!
var memo = Array(repeating: 0, count: n+2)
memo[1] = 1
memo[2] = 1


print(fibonacci(n))

func fibonacci(_ n: Int) -> Int {
    if n == 1 { return 1 }
    
    for i in 2...n+1 {
        memo[i] = (memo[i-2] + memo[i-1]) % 15746
    }
    
    return memo[n+1]
}
