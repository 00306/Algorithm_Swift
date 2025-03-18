//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/10/24.
//

let T = Int(readLine()!)!
var answer = ""

for _ in 0..<T {
    var cent = Int(readLine()!)!
    
    let quarter = cent / 25
    cent %= 25
    
    let dime = cent / 10
    cent %= 10
    
    let nickel = cent / 5
    cent %= 5
    
    let penny = cent
    
    answer += "\(quarter) \(dime) \(nickel) \(penny)\n"
}

print(answer)
