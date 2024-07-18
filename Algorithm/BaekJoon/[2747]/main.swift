//
//  [2747].swift
//  Algorithm
//
//  Created by 송지혁 on 8/7/24.
//

let n = Int(readLine()!)!
var dp = Array(repeating: 0, count: n+1)
dp[1] = 1


for i in 2..<n+1 {
    dp[i] = dp[i-1] + dp[i-2]
}

print(dp[n])

