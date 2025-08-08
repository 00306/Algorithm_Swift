//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 8/9/25.
//

let string = readLine()!
var stack: [String] = []
var isPPAP = true

for char in string {
    if let last = stack.last, last == "A", char == "P" {
        var buffer = "\(char)"
        var count = 1
        
        while count < 4, let popped = stack.popLast() {
            buffer += popped
            count += 1
        }
        
        if buffer == "PAPP" { stack.append("P") }
        else {
            isPPAP = false
            break
        }
    }
    else { stack.append(String(char)) }
}

print(isPPAP && stack.count == 1 && stack[0] == "P" ? "PPAP" : "NP")
