//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 8/10/25.
//

import Foundation

let string = readLine()!
let pattern = #"^(10(0)+(1)+|01)+$"#
let regex = try! NSRegularExpression(pattern: pattern)
let range = NSRange(location: 0, length: string.utf16.count)

print(regex.firstMatch(in: string, range: range) == nil ? "NOISE" : "SUBMARINE")
    
