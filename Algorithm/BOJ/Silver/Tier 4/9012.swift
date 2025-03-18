//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 5/10/24.
//

let t = Int(readLine()!)!
var result = ""

for _ in 0..<t {
    var count = 0
    var input = readLine()!.map { $0 }

    for _ in 0..<input.count {
        switch input.popLast() {
            case ")": count += 1
            case "(": count -= 1
            default: break
        }
        
        if count < 0 { break }
    }
    
    if count == 0 {
        result += "YES\n"
    } else {
        result += "NO\n"
    }
}

print(result)
