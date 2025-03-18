//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/5/24.
//

let NM = readLine()!.split(separator: " ").map { Int($0)! }
let n = NM[0]
let m = NM[1]
var buckets: [Int] = []

(1...n).forEach { buckets.append($0) }

for _ in 0..<m {
    let swap_num = readLine()!.split(separator: " ").map { Int($0)! }
    buckets.swapAt(swap_num[0] - 1, swap_num[1] - 1)
}

buckets.forEach { print($0, terminator: " ") }

