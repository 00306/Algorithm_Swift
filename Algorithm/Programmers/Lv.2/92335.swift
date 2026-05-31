//
//  92335.swift
//  Algorithm
//
//  Created by 송지혁 on 5/31/26.
//

import Foundation

func conversion(_ n: Int, to k: Int) -> [String] {
    var currentNumber = n
    var numberString = ""
    
    while currentNumber > 0 {
        numberString += String(currentNumber % k)
        currentNumber /= k
    }
    
    let result = Array(numberString
        .map { String($0) }
        .reversed())
    
    return result
}

func isPrime(_ n: Int) -> Bool {
    if n < 2 { return false }
    if n == 2 { return true }
    
    for i in 2..<Int(sqrt(Double(n)))+1 {
        if n % i == 0 { return false }
    }
    
    return true
}

func solution(_ n: Int, _ k: Int) -> Int {
    let numberArray = conversion(n, to: k)
    let conversionedNumber = Int(numberArray.joined(separator: ""))!
    var current = ""
    var result = 0
    
    for number in numberArray {
        if number == "0" {
            if current.isEmpty { continue }
            if isPrime(Int(current)!) { result += 1 }
            current = ""
            continue
        }
        
        current += number
    }
    
    if !current.isEmpty {
        if isPrime(Int(current)!) { result += 1 }
    }
    
    return result
}
