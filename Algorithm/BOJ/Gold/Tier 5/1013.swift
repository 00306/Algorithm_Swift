//
//  maini.swift
//  Algorithm
//
//  Created by 송지혁 on 11/5/25.
//

import Foundation

let T = Int(readLine()!)!
var result = ""

for _ in 0..<T {
    let signal = readLine()!
    let pattern = "^((100+1+)|(01))+$"
    let regex = try! NSRegularExpression(pattern: pattern)
    let range = NSRange(signal.startIndex..<signal.endIndex, in: signal)
    
    if let _ = regex.firstMatch(in: signal, range: range) {
        result += "YES\n"
    } else { result += "NO\n" }
}

print(result)
