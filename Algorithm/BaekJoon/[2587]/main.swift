//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/23/24.
//

var array = [Int]()

for _ in 0..<5 {
    array.append(Int(readLine()!)!)
}

print(array.reduce(0, +)/5)
print(array.sorted()[2])
