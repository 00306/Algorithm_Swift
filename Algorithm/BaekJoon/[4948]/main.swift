//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 5/7/24.
//

import Foundation

var numbers: [Int] = []

while true {
    let input = Int(readLine()!)!
    if input == 0 { break }
    numbers.append(input)
}

for num in numbers {
    var sieves: [Bool] = Array(repeating: true, count: 2*num + 1)
    var count = 0
    sieves[0] = false
    sieves[1] = false
    
    
    for i in 2..<Int(sqrt(Double(2*num))) + 1 where sieves[i] == true {
        var j = 2
        
        while i * j <= 2*num {
            sieves[i * j] = false
            j += 1
        }
    }
    
    for i in num+1...2*num {
        if sieves[i] {
            count += 1
        }
    }
    
    print(count)
}
