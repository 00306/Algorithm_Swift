//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/5/24.
//

let n = Int(readLine()!)!
var score_arr = readLine()!.split(separator: " ").map { Double($0)! }
let max = score_arr.max()!

for i in 0..<n {
    score_arr[i] = score_arr[i] / max * 100
}


print(score_arr.reduce(0.0, +)/Double(n))
