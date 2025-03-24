//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 3/24/25.
//

let n = Int(readLine()!)!

var zeroBelowNumbers: [Int] = []
var zeroOverNumbers: [Int] = []
var result = 0

for _ in 0..<n {
    let number = Int(readLine()!)!
    
    number > 0 ? zeroOverNumbers.append(number) : zeroBelowNumbers.append(number)
}

zeroOverNumbers.sort(by: >)
zeroBelowNumbers.sort(by: <)

for i in stride(from: 0, to: zeroOverNumbers.count, by: 2) {
    if i+1 >= zeroOverNumbers.count {
        result += zeroOverNumbers[i]
        break
    }
    
    if zeroOverNumbers[i+1] == 1 {
        result += zeroOverNumbers[i] + zeroOverNumbers[i+1]
    } else {
        result += zeroOverNumbers[i] * zeroOverNumbers[i+1]
    }
}

for i in stride(from: 0, to: zeroBelowNumbers.count, by: 2) {
    if i+1 >= zeroBelowNumbers.count {
        result += zeroBelowNumbers[i]
        break
    }
    
    result += zeroBelowNumbers[i] * zeroBelowNumbers[i+1]
}


print(result)

