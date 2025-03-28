//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 3/27/25.
//

import Foundation

let n = Int(readLine()!)!
let k = Int(readLine()!)!
let sensors = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
var distances: [Int] = []
var result = 0

for i in 0..<sensors.count-1 {
    let distance = sensors[i+1] - sensors[i]
    distances.append(distance)
}

distances.sort(by: { $0 > $1 })

if k < n {
    for i in k-1..<distances.count {
        result += distances[i]
    }
}
    


print(result)
