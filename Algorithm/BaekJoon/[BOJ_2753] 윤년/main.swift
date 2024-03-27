//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 3/27/24.
//

import Foundation

let input = Int(readLine()!)!

if !(input >= 1 && input <= 4000) {
    exit(1)
}
print(input % 4 == 0 && (input % 400 == 0 || input % 100 != 0) ? "1" : "0")
