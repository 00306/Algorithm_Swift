//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 3/30/24.
//

import Foundation

let numbers = readLine()!.components(separatedBy: " ").map { Int($0)! }
var numbers_dictionary: Dictionary<Int, Int> = [:]
var reward = 0

for num in numbers {
    if numbers_dictionary.contains(where: { $0.key == num }) {
        numbers_dictionary[num]! += 1
    } else {
        numbers_dictionary[num] = 1
    }
}

if numbers_dictionary.count == 1 {
    reward += 10000 + numbers_dictionary.first!.key * 1000
} else if numbers_dictionary.count == 2 {
    let number = numbers_dictionary.filter { $0.value == 2 }
    reward += 1000 + number.first!.value * 100
} else if numbers_dictionary.count == 3 {
    let number = numbers_dictionary.max(by: { $0.key < $1.key })
    reward += number!.key * 100
}

print(reward)
