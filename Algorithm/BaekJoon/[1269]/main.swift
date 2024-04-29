//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/29/24.
//

let n = readLine()!.split(separator: " ").map { Int($0)! }

let a = readLine()!.split(separator: " ").map { Int($0)! }
let b = readLine()!.split(separator: " ").map { Int($0)! }

print(Set(a).subtracting(b).count + Set(b).subtracting(a).count)
