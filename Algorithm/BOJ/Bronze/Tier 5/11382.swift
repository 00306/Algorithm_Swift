//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 3/11/24.
//

import Foundation

let input = readLine()!
let number_array = input.components(separatedBy: " ")

var result = number_array.reduce(0) { partialResult, element in
    return partialResult + Int(element)!
}

print(result)
