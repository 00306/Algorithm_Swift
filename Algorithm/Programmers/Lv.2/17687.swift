//
//  17687.swift
//  Algorithm
//
//  Created by 송지혁 on 8/5/26.
//

func baseConversion(_ n: Int, number: Int) -> String {
    if number == 0 { return "0" }
    var conversion = ""
    var currentNumber = number
    
    while currentNumber > 0 {
        let remain = currentNumber % n
        
        if remain >= 10 {
            let aAscii = Character("A").asciiValue!
            let digit = String(UnicodeScalar(aAscii + UInt8(remain - 10)))
            conversion += digit
        } else {
            conversion += String(remain)
        }
        
        currentNumber /= n
    }
    
    return Array(conversion.map { String($0) }.reversed()).joined()
}

func solution(_ n: Int, _ t: Int, _ m: Int, _ p: Int) -> String {
    var digits: [String] = []
    var result = ""
    
    for number in 0..<t*m {
        let conversion = baseConversion(n, number: number)
        conversion.forEach { digits.append(String($0)) }
    }
    
    for (i, digit) in digits.enumerated() where i % m == p-1 {
        if i >= t * m { break }
        result += digit
    }
    
    return result
}
