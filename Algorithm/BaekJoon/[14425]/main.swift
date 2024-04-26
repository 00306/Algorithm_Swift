//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/26/24.
//

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let m = input[1]

var count = 0

var dict: [String:Int] = [:]

for _ in 0..<n {
    let str = readLine()!
    dict[str] = 0
}

for _ in 0..<m {
    let str = readLine()!
    
    if dict[str] != nil {
        count+=1
    }
}

print(count)
