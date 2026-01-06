//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 12/18/25.
//

let s = readLine()!.map { String($0) }
var maxLength = 0
let length = s.count

for k in 0..<length {
    var pi = [Int](repeating: 0, count: length)
    var j = 0
    
    for i in 1..<length-k {
        while j > 0, s[i+k] != s[j+k] {
            j = pi[j-1]
        }
        
        if s[i+k] == s[j+k] {
            j += 1
            pi[i] = j
            maxLength = max(maxLength, j)
            
        }
    }
}

print(maxLength)
