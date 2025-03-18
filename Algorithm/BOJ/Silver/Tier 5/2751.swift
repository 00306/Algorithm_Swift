//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/23/24.
//

// 1344ms
let n = Int(readLine()!)!

var array = [Int]()

for _  in 0..<n {
    array.append(Int(readLine()!)!)
}

array.sorted().forEach { print($0) }

// 740ms
//let n = Int(readLine()!)!
//let array = (1...n).map { _ in Int(readLine()!)! }.sorted()
//print(array.map { "\($0)\n" }.joined())
