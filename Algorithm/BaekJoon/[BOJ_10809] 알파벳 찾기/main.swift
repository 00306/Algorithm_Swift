//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/8/24.
//

let S = readLine()!.map { $0.asciiValue! }
(97...122).forEach { print(S.firstIndex(of: $0) ?? -1, terminator: " ") }

