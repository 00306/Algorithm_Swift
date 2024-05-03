//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 5/4/24.
//

let n = Int(readLine()!)!
var trees: [Int] = []

for _ in 0..<n {
    trees.append(Int(readLine()!)!)
}

var distance: [Int] = []

trees.enumerated().forEach { index, value in
    if index > 0 {
        distance.append(value - trees[index-1])
    }
}

var newDistance = distance[0]

distance.forEach {
    newDistance = gcd(num1: newDistance, num2: $0)
}

print((((trees.last! - trees[0]) / newDistance) - 1) - (n - 2))



func gcd(num1: Int, num2: Int) -> Int {
    if num1 % num2 == 0 { return num2 }
    
    return gcd(num1: num2, num2: num1 % num2)
}

