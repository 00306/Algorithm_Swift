//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 5/9/24.
//


let n = Int(readLine()!)!
var array: [Int] = []

for _ in 0..<n {
    let order = readLine()!.split(separator: " ").map { Int($0)! }
    switch order[0] {
    case 1:
        array.append(order[1])
    case 2:
        print(array.popLast() ?? -1)
    case 3:
        print(array.count)
    case 4:
        print(array.isEmpty ? 1 : 0)
    case 5:
        print(array.last ?? -1)
    default:
        print("")
    }
}
