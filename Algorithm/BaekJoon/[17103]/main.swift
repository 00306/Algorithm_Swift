//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 5/8/24.
//

import Foundation

let t = Int(readLine()!)!
var numbers: [Int] = []
var result = ""


for _ in 0..<t {
    numbers.append(Int(readLine()!)!)
}

for number in numbers {
    var sieves: [Bool] = Array(repeating: true, count: number + 1)
    var count = 0
    sieves[0] = false
    sieves[1] = false
    
    for i in 2..<Int(sqrt(Double(number))) + 1 where sieves[i] == true {
        var j = 2
        
        while i * j <= number {
            sieves[i * j] = false
            j += 1
        }
    }
    
    for i in 0..<sieves.count {
        if sieves[i], sieves[number-i] {
            count += 1
        }
    }

    
    result += "\(count % 2 == 0 ? count / 2 : count / 2 + 1)\n"
}

print(result)
