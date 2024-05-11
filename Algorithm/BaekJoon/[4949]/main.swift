//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 5/10/24.
//

var result = ""

while let input = readLine(), input != "." {
    var stack: [Character] = []
    var mark = false
    
    for char in input {
        if mark {
            break
        }
        
        switch char {
        case "(", "[":
            stack.append(char)
        case ")":
            if let last = stack.last, last == "(" {
                stack.removeLast()
            } else {
                mark = true
            }
        case "]":
            if let last = stack.last, last == "[" {
                stack.removeLast()
            } else {
                mark = true
            }
            
        default:
            continue
        }
    }
    
    result += stack.isEmpty && !mark ? "yes\n" : "no\n"
}

print(result)
