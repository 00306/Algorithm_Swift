//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/8/24.
//

var dictionary = Dictionary(readLine()!.uppercased().map { ($0, 1) }, uniquingKeysWith: +)
let maxValue = dictionary.filter { $0.value == dictionary.values.max()! }
print(maxValue.count > 1 ? "?" : maxValue.keys.first!)

