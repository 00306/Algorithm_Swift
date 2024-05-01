//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 5/1/24.
//

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let m = input[1]

var cantListen_dict: [String:Int] = [:]
var count = 0
var cantListenAndSee_arr: [String] = []


for _ in 0..<n {
    cantListen_dict[readLine()!] = 0
}

for _ in 0..<m {
    let name = readLine()!
    if cantListen_dict[name] != nil {
        count += 1
        cantListenAndSee_arr.append(name)
    }
}


print(count)
print(cantListenAndSee_arr.sorted().joined(separator: "\n"))
