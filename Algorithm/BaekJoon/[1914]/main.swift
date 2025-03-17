//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 3/17/25.
//

import Foundation

let N = Int(readLine()!)!
var result = ""

func hanoi(n: Int, _ main: Int, _ auxility: Int, _ arrival: Int) {
    
    if n == 1 {
        result += "\(main) \(arrival)\n"
        return
    }
    
    hanoi(n: n-1, main, arrival, auxility)
    result += "\(main) \(arrival)\n"
    hanoi(n: n-1, auxility, main, arrival)
}

let count = pow(2, N) - 1
print(count)

if N <= 20 {
    hanoi(n: N, 1, 2, 3)
    print(result)
}
