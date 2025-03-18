//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 10/26/24.
//

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
var c = input[1]
var coordinates: [Int] = []
var result = 0



for _ in 0..<n {
    let coordinate = Int(readLine()!)!
    coordinates.append(coordinate)
}

coordinates.sort()


var left = 1
var right = coordinates.last! - coordinates.first!

while left <= right {
    let mid = (left + right) / 2
    var count = 1
    var coordinate = coordinates[0]
    
    for i in 1..<n {
        if coordinates[i] - coordinate >= mid {
            count += 1
            coordinate = coordinates[i]
        }
    }
    
    if count >= c {
        result = mid
        left = mid + 1
    } else {
        right = mid - 1
    }
}

print(result)
