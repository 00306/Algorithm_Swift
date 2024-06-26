//
//  11047.swift
//  Algorithm
//
//  Created by 송지혁 on 6/26/24.
//

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
var k = input[1]
var coins: [Int] = []
var count = 0

for _ in 0..<n {
    coins.append( Int(readLine()!)! )
}

for coin in coins.reversed() {
    count += k / coin
    k %= coin
}

print(count)
