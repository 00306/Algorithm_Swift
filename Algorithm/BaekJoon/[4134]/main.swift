//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 5/5/24.
//

import Foundation

let T = Int(readLine()!)!
var result = ""

for _ in 0..<T {
    let n = Int(readLine()!)!
    
    if n <= 2 {
        result += "2\n"
        continue
    }
    
    var i = 0
    
    while !isPrimeNumber(n+i) {
        i += 1
    }
    
    result += "\(n+i)\n"
}

func isPrimeNumber(_ num: Int) -> Bool {
    for i in 2..<Int(sqrt(Double(num))) + 1 {
        if num % i == 0 {
            return false
        }
    }
    
    return true
}

print(result)
