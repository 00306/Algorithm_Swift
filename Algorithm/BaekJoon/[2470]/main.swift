//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 2/21/25.
//

let n = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
var result = (0, 0)
var minValue = Int.max

var left = 0
var right = n - 1


while left < right {
    let leftValue = numbers[left]
    let rightValue = numbers[right]
    let sum = leftValue + rightValue
    
    if abs(sum) < minValue {
        result = (leftValue, rightValue)
        minValue = abs(sum)
    }
    
    if sum < 0 {
        left += 1
    } else {
        right -= 1
    }
}

print(result.0, result.1)
