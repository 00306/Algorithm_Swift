//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 5/15/24.
//

let t = Int(readLine()!)!
var result = ""


for _ in 0..<t {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    var westSpotCount = input[0]
    let eastSpotCount = input[1]
    
    if westSpotCount > eastSpotCount / 2 {
        westSpotCount = eastSpotCount - westSpotCount
    }
    
    var numerator = 1
    var denominator = 1
    
    for i in 0..<westSpotCount {
        numerator *= eastSpotCount - i
        denominator *= i+1
    }
    
    result += "\(numerator / denominator)\n"
}

print(result)
