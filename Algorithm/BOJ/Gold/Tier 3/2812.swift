//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 3/29/25.
//

let nk = readLine()!.split(separator: " ").map { Int($0)! }
let n = nk[0]
let k = nk[1]

let number = readLine()!.map { String($0) }
var stack: [Int] = []
var count = 0

for i in 0..<number.count {
    let digit = Int(number[i])!
    
    while let last = stack.last, last < digit, count < k {
        stack.removeLast()
        count += 1
    }
    
    stack.append(digit)
}

print(stack.map { String($0) }[..<(n-k)].joined(separator: ""))
