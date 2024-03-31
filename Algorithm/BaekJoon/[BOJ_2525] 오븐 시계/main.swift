//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/1/24.
//

let currentTime = readLine()!.split(separator: " ").map { Int($0)! }
var hour: Int = currentTime[0]
var minute: Int = currentTime[1]

let duration = Int(readLine()!)!

    hour += duration / 60
    minute += duration % 60
    
    if minute > 59 {
        hour += minute / 60
        minute = minute % 60
    }
    
    if hour > 23 {
        hour = hour - 24
    }

print(hour, minute)
