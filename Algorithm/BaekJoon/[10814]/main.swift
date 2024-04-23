//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/24/24.
//

let n = Int(readLine()!)!
var user_arr = [(Int, String)]()


for _ in 0..<n {
    let u = readLine()!.split(separator: " ")
    user_arr.append((Int(u[0])!, String(u[1])))
}

user_arr.sorted { $0.0 < $1.0 }.forEach { print($0.0, $0.1) }
