//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 6/28/24.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let s = input[1]
let sequence = readLine()!.split(separator: " ").map { Int($0)! }
var count = 0

func dfs(currentIndex: Int, sum: Int) {
    
    
    for i in currentIndex..<n {
        if sum+sequence[i] == s { count += 1 }
        dfs(currentIndex: i+1, sum: sum+sequence[i])
    }
}

dfs(currentIndex: 0, sum: 0)
print(count)
