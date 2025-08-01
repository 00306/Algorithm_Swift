//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 8/2/25.
//

func countAllWaysToTakePill(quantity: Int) -> Int {
    if quantity == 1 { return 1 }
    
    var dp = Array(repeating: [Int](repeating: 0, count: quantity + 1), count: quantity + 1)
    
    for i in 0...quantity {
        dp[i][0] = 1
    }
    
    
    for i in 1..<quantity+1 {
        for j in 1...i {
            dp[i][j] = dp[i-1][j] + dp[i][j-1]
        }
    }
    
    return dp[quantity][quantity]
}

var result = ""

while let N = Int(readLine()!), N != 0 {
    result += "\(countAllWaysToTakePill(quantity: N))\n"
}

print(result)
