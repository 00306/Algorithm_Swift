//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 5/19/24.
//

while let input = readLine() {
    var number = 1
    (0..<Int(input)!).forEach { _ in number *= 3 }
    let array = Array(repeating: "-", count: number)
    let result = recursion(array)
    print(result.joined(separator: ""))
}

func recursion(_ array: [String]) -> [String] {
    if array.count <= 1 { return array }
    let centerStart = array.count / 3
    let centerEnd = array.count * 2 / 3 - 1
    let firstArray = Array(array[0..<centerStart])
    let centerArray = Array(repeating: " ", count: centerEnd - centerStart + 1)
    let lastArray = Array(array[centerEnd + 1..<array.count])
    
    return recursion(firstArray) + recursion(centerArray) + recursion(lastArray)
}


