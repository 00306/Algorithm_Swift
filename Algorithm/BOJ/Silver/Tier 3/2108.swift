//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 5/17/24.
//

import Foundation

let n = Int(readLine()!)!
var numArray: [Int] = []
var numDictionary: [Int: Int] = [:]
var result = ""
var max: [(Int, Int)] = []


for _ in 0..<n {
    let num = Int(readLine()!)!
    numArray.append(num)
    if numDictionary[num] == nil {
        numDictionary[num] = 1
    } else {
        numDictionary[num]! += 1
    }
}

var maxValue = numDictionary.values.max()!
for (key, value) in numDictionary {
    if value == maxValue {
        if !max.contains(where: { $0.0 == key }) {
            max.append((key, value))
        }
    }
}

numArray = numArray.sorted()
max = max.sorted(by: { $0.0 < $1.0 })


result += "\(Int(round(Double(numArray.reduce(0, +)) / Double(n))))\n"
result += "\(numArray[numArray.count / 2])\n"

if max.count > 1 {
    result += "\(max[1].0)\n"
} else {
    result += "\(max[0].0)\n"
}

result += "\(numArray.max()! - numArray.min()!)"

print(result)






