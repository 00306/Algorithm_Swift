//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 3/29/24.
//

import Foundation

let time = readLine()!.components(separatedBy: " ").map { Int($0)! }
var hour = time[0]
var minute = time[1]

minute -= 45

if minute < 0 {
    hour -= 1
    
    if hour < 0 {
        hour = 24 + hour
    }
    
    minute = 60 + (minute)
}

print(hour, minute)
