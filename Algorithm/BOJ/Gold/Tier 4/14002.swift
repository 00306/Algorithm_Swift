//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 10/28/24.
//

let n = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").map { Int($0)! }
var dp = Array(repeating: 1, count: n)
var predecessor = Array(repeating: -1, count: n)

for i in 0..<n {
    for j in 0..<i {
        if numbers[j] < numbers[i], dp[i] < dp[j] + 1 {
            dp[i] = dp[j] + 1
            predecessor[i] = j
        }
    }
}

let lisLength = dp.max()!
var lisIndex = dp.firstIndex(of: lisLength)!
var lis: [Int] = []

while lisIndex != -1 {
    lis.append(numbers[lisIndex])
    lisIndex = predecessor[lisIndex]
}

lis.reverse()

print(lisLength)
lis.forEach { print($0, terminator: " ") }

// ㅈ@ㄴ 어렵네 ㅠ
