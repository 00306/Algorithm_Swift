//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/5/24.
//

let NM = readLine()!.split(separator: " ").map { Int($0)! }
let n = NM[0]
let m = NM[1]

var buckets: Array<Int> = Array(1...n)

for _ in 0..<m {
    let swap_index = readLine()!.split(separator: " ").map { Int($0)! }
    buckets[swap_index[0]-1...swap_index[1]-1].reverse()
}


buckets.forEach { print($0, terminator: " ") }

