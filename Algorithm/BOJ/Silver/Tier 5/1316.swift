//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/9/24.
//

var n = Int(readLine()!)!

for _ in 0..<n {
    let word = readLine()!
    var arr: [Character] = []
    
    for char in word {
        if !arr.contains(char) {
            arr.append(char)
        } else if arr.last! != char {
            n -= 1
            break
        }
    }
}


print(n)
