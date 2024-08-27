//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 9/16/24.
//

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let k = input[1]
let mod = 1_000_000_007

var memo = Array(repeating: 1, count: n+1)

func getModularInverse(_ num: Int, p: Int = mod - 2) -> Int {
    if p == 1 { return num }
    if p % 2 != 0 { return num * getModularInverse(num, p: p - 1) % mod }
    
    let half = getModularInverse(num, p: p/2) % mod
    
    return half * half % mod
}

func factorial(_ n: Int) -> Int {
    if memo[n] != 1 { return memo[n] }
    
    for i in 1..<n+1 {
        memo[i] = memo[i-1] * i % mod
    }
    
    return memo[n]
}

print(factorial(n) * getModularInverse(factorial(k) * factorial(n - k) % mod) % mod)
