//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/8/24.
//

let input = readLine()!
var char_dictionary: [String: Int] = [:]

for char in input {
    let alphabet = String(char).uppercased()
    if char_dictionary[alphabet] == nil {
        char_dictionary[alphabet] = 1
    } else {
        char_dictionary[alphabet]! += 1
    }
}

let max = char_dictionary.filter { $0.value == char_dictionary.values.max()! }

print(max.count >= 2 ? "?" : max.first!.key)
