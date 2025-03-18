//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/9/24.
//

var twoDemension_arr = [[Int]]()
var maxNum = 0
var coordinate = (x: 0, y: 0)

for _ in 0..<9 {
    twoDemension_arr.append(readLine()!.split(separator: " ").map { Int($0)! })
}

for y in 0..<9 {
    for x in 0..<9 {
        if twoDemension_arr[y][x] >= maxNum {
            maxNum = twoDemension_arr[y][x]
            coordinate = (x, y)
        }
    }
}

print(maxNum)
print("\(coordinate.y+1) \(coordinate.x+1)")
