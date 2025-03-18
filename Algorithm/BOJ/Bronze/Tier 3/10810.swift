//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/5/24.
//

let NM = readLine()!.split(separator: " ").map { Int($0)! }
let n = NM[0]
let m = NM[1]
var buckets = [Int](repeating: 0, count: n)

for _ in 0..<m {
    let ball_arr = readLine()!.split(separator: " ").map { Int($0)! }
    
    for j in ball_arr[0]...ball_arr[1] {
        buckets[j-1] = ball_arr[2]
    }
}

let _ = buckets.map { print($0, terminator: " ") }
