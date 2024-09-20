//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 10/27/24.
//

let n = Int(readLine()!)!
let k = Int(readLine()!)!

var left = 1
var right = n*n
var result = 0

while left <= right {
    var count = 0
    let mid = (left + right) / 2
    
    for i in 1...n {
        count += min(n, mid/i)
    }
    
    if count >= k {
        result = mid
        right = mid - 1
    } else if count < k {
        left = mid + 1
    }
}

print(result)
