//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/19/24.
//

var numberSet: [Int] = []

for _ in 0..<3 {
    numberSet.append(Int(readLine()!)!)
}

if numberSet.reduce(0, +) == 180 {
    if Set(numberSet).count == 3 {
        print("Scalene")
    } else if Set(numberSet).count == 2 {
        print("Isosceles")
    } else if Set(numberSet).count == 1 {
        print("Equilateral")
    }
} else {
    print("Error")
}
