//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 5/7/24.
//

import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
var result = ""

let m = input[0]
let n = input[1]
var sieves: [Bool] = Array(repeating: true, count: n+1)
sieves[0] = false
sieves[1] = false

for i in 2..<Int(sqrt(Double(n))) + 1 where sieves[i] == true {
    var j = 2
    
    while i * j <= n {
        sieves[i*j] = false
        j+=1
    }
}


for i in m...n {
    if sieves[i] {
        result += "\(i)\n"
    }
}

print(result)
