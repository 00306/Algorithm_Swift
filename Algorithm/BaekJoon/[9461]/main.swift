//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 6/3/24.
//

let t = Int(readLine()!)!
var memo = Array(repeating: 0, count: 101)
memo[0] = 1
memo[1] = 1
memo[2] = 1
memo[3] = 2
memo[4] = 2
var result = ""

for _ in 0..<t {
    let n = Int(readLine()!)!
    
    result += "\(dp(n))\n"
}

print(result)

func dp(_ n: Int) -> Int {
    if n < 5 { return memo[n-1] }
    
    for i in 5..<n {
        memo[i] = memo[i-1] + memo[i-5]
    }
    
    return memo[n-1]
}
