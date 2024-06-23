//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 6/23/24.
//

let NM = readLine()!.split(separator: " ").map { Int($0)! }
let N = NM[0]
let M = NM[1]
var prefix = [0] + readLine()!.split(separator: " ").map { Int($0)! }
var remainderDictionary: [Int: Int] = [:]
var count = 0

for i in 0...N-1 {
    prefix[i+1] = (prefix[i+1] + prefix[i]) % M
    remainderDictionary[prefix[i+1], default: 0] += 1
}

for i in 0..<M {
    guard let remainderCount = remainderDictionary[i] else { continue }
    
    if i == 0 { count += remainderCount }
    if remainderCount > 1 {  count += (remainderCount * (remainderCount - 1)) / 2 }
}

print(count)
