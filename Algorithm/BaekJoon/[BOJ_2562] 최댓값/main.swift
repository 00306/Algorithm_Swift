//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/5/24.
//

var num_arr: [Int] = []

for _ in 0..<9 {
    num_arr.append(Int(readLine()!)!)
}

let max_num = num_arr.max()!
let index = num_arr.firstIndex(of: max_num)!
print("\(max_num)\n\(index+1)")
