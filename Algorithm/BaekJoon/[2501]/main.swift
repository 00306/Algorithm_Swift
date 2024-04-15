//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/15/24.
//
import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
var N = input[0]
let K = input[1]

var measure: [Int] = []
let numSqrt = Int(sqrt(Double(N)))

for i in 1...numSqrt {
    if N % i == 0 {
        measure.append(i)
        
        if N / i != i {
            measure.append(N/i)
        }
    }
}
if measure.count < K {
    print(0)
} else {
    print(measure.sorted(by: <)[K-1])
}


