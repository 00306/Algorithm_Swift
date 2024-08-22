//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 9/10/24.
//

let n = Int(readLine()!)!
let roadLength = readLine()!.split(separator: " ").map { UInt($0)! }
let oilPrice = readLine()!.split(separator: " ").map { UInt($0)! }
var minOilPrice: UInt = oilPrice[0]
var result: UInt = 0

for i in 1..<n {
    result += minOilPrice * roadLength[i-1]
    minOilPrice = min(minOilPrice, oilPrice[i])
    
    
}

print(result)
