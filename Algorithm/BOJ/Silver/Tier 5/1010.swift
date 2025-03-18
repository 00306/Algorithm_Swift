//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 5/15/24.
//

let t = Int(readLine()!)!

(0..<t).forEach { _ in
    let input = readLine()!.split(separator: " ").map { Int($0)! }, n = input[0], m = input[1]
    
    var result = 1
    for i in 0..<m-n {
        result = result * (m-i) / (i+1)
        // result *= (m-i) / (i+1)
    }
    
    print(result)
    
}
