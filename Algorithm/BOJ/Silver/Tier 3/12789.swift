//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 5/12/24.
//

let n = Int(readLine()!)!
var numbers = readLine()!.split(separator: " ").map { Int($0)! }

var stack: [Int] = []

var order = 1
var index = 0

while order <= n {
    if index == numbers.count { break }
    
    if numbers[index] == order {
        order += 1
        if index != numbers.count - 1 {
            index += 1
        }
        
    } else if let last = stack.last, last == order {
        stack.removeLast()
        order += 1
    } else {
        stack.append(numbers[index])
        index += 1
    }
    
    
}

print(order == n+1 ? "Nice" : "Sad")
