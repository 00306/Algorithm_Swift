//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/1/24.
//

let result = Int(readLine()!)!
let numbersOfStuff = Int(readLine()!)!
var sumOfStuff = 0

for _ in 1...numbersOfStuff {
    let stuff = readLine()!.split(separator: " ").map { Int($0)! }.reduce(1, *)
    
    sumOfStuff += stuff
}

print(result == sumOfStuff ? "Yes" : "No")
