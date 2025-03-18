//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 1/4/25.
//

import Foundation

let n = Int(readLine()!)!
var numbers = readLine()!.split(separator: " ").map { Int($0)! }
let target = Int(readLine()!)!
let max = numbers.max()!
var numberArray = Array(repeating: 0, count: max + 1)
var result = 0

for num in numbers { numberArray[num] = 1 }

numbers.sort(by: >)

for num in numbers where target > num {
    if target - num > max { continue }
    if numberArray[target-num] == 1 { result += 1 }
}

print(result / 2)
