//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 3/16/25.
//

let n = Int(readLine()!)!

func drawTriangle(n: Int) -> [String] {
    if n == 3 {
        return [
            "  *  ",
            " * * ",
            "*****"
        ]
    }
    
    let half = n / 2
    let top = drawTriangle(n: half)
    let bottom = drawTriangle(n: half)
    
    let topWithPadding = top.map { String(repeating: " ", count: half) + $0 + String(repeating: " ", count: half) }
    
    let bottomMerged = zip(bottom, bottom).map { $0 + " " + $1 }
    
    return topWithPadding + bottomMerged
}

let result = drawTriangle(n: n)
print(result.joined(separator: "\n"))
