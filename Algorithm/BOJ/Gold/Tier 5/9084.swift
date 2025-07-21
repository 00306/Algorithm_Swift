//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 7/21/25.
//

func findAllCombination(coins: [Int], cost: Int) -> Int {
    var dp = Array(repeating: 0, count: cost + 1)
    dp[0] = 1
    
    for coin in coins {
        for i in 1..<cost+1 {
            if i-coin < 0 { continue }
            dp[i] += dp[i-coin]
        }
    }
    
    return dp[cost]
}

let T = Int(readLine()!)!
var result = ""

for _ in 0..<T {
    let N = Int(readLine()!)!
    let coins = readLine()!.split(separator: " ").map { Int($0)! }
    let cost = Int(readLine()!)!
    
    result += "\(findAllCombination(coins: coins, cost: cost))\n"
}

print(result)

