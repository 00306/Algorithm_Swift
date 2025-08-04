//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 8/5/25.
//

func checkNumbersConsistency(numbers: [String]) -> String {
    for i in 0..<numbers.count - 1 {
        let length = numbers[i].count < numbers[i+1].count ? numbers[i].count : numbers[i+1].count
        let startIndex = numbers[i].startIndex
        let endIndex = numbers[i].index(startIndex, offsetBy: length - 1)
        
        if numbers[i][startIndex...endIndex] == numbers[i+1][startIndex...endIndex] {
            return "NO"
        }
        
    }
    
    
    return "YES"
}

let T = Int(readLine()!)!
var result = ""

for _ in 0..<T {
    let N = Int(readLine()!)!
    var numbers: [String] = []
    
    for _ in 0..<N {
        let number = readLine()!
        numbers.append(number)
    }
    
    numbers.sort()
    
    result += "\(checkNumbersConsistency(numbers: numbers))\n"
}

print(result)
