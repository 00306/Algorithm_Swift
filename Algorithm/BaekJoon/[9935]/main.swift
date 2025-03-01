//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 3/1/25.
//

var string = readLine()!.map { $0 }
let boomChar = readLine()!.map { $0 }
var stack: [Character] = []

while !string.isEmpty {
    let lastChar = string.removeLast()
    var tempStack: [Character] = [lastChar]
    
    if lastChar == boomChar[0] {
        for i in 1..<boomChar.count {
            guard let char = stack.last else { break }
            if char != boomChar[i] { break }
            tempStack.append(stack.removeLast())
        }
    }
    
    if tempStack != boomChar {
        stack += tempStack.reversed()
    }
}

print(stack.isEmpty ? "FRULA" : stack.reversed().map { String($0) }.joined(separator: ""))
