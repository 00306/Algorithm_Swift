//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 6/2/24.
//

let n = Int(readLine()!)!
var memo = Array(repeating: 0, count: n+1)


print(fibonacci(n))

func fibonacci(_ n: Int) -> Int {
    if n <= 1 { return 1 }
    
    return memoization(n-2) + memoization(n-1)
}


func memoization(_ n: Int) -> Int {
    memo[n] == 0 ? fibonacci(n) : memo[n]
}
