//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/1/24.
//

let currentTime = readLine()!.split(separator: " ").map { Int($0)! }
let duration = Int(readLine()!)!
var hour: Int = currentTime[0]
var minute: Int = currentTime[1] + duration

hour = (hour + minute / 60) % 24
minute = minute % 60

print(hour, minute)
