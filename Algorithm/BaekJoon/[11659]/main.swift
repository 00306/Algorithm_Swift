//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 6/19/24.
//

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let m = input[1]
var sequence = [0] + readLine()!.split(separator: " ").map { Int($0)! }
var coordinates: [(Int, Int)] = []

var result = ""

for _ in 0..<m {
    let coordinate = readLine()!.split(separator: " ").map { Int($0)! }
    coordinates.append((coordinate[0]-1, coordinate[1]))
}


for i in 1...n {
    sequence[i] = sequence[i-1] + sequence[i]
}

for coordinate in coordinates {
    print(sequence[coordinate.1] - sequence[coordinate.0])
}

