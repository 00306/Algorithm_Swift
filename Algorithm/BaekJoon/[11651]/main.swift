//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/23/24.
//

let n = Int(readLine()!)!

var tup_array = [(Int, Int)]()

for _ in 0..<n {
    let coordinate = readLine()!.split(separator: " ").map { Int($0)! }
    tup_array.append((coordinate[0], coordinate[1]))
}

tup_array.sorted { current, next in
    if current.1 == next.1 {
        return current.0 < next.0
    } else {
        return current.1 < next.1
    }
}.forEach { print($0.0, $0.1) }

