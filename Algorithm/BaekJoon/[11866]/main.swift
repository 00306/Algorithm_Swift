//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 5/13/24.
//

let input = readLine()!.split(separator: " ").map { Int($0)! }
let peopleCount = input[0]
let removeNumber = input[1]

var peoples = Array(1...input[0])
var result: [String] = []

var index = 0
while peoples.count != 0 {
    index = (index + removeNumber - 1) % peoples.count
    result.append("\(peoples.remove(at: index))")
}

print("<\(result.joined(separator: ", "))>")
