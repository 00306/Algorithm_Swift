//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 8/15/25.
//

let firstRomeNumber = readLine()!.map { String($0) }
let secondRomeNumber = readLine()!.map { String($0) }
let symbol: [String: Int] = [
    "I": 1,
    "V": 5,
    "X": 10,
    "L": 50,
    "C": 100,
    "D": 500,
    "M": 1000
]

let decendingRomeSymbol: [(String, Int)] = [
    ("M", 1000),
    ("CM", 900),
    ("D", 500),
    ("CD", 400),
    ("C", 100),
    ("XC", 90),
    ("L", 50),
    ("XL", 40),
    ("X", 10),
    ("IX", 9),
    ("V", 5),
    ("IV", 4),
    ("I", 1)
]

func convertRomeNumberToArabian(romeNumber: [String]) -> Int {
    var result = 0
    var prev = 0
    
    for romeSymbol in romeNumber.reversed() {
        if let value = symbol[romeSymbol] {
            if value >= prev {
                result += value
            } else {
                result -= value
            }
            
            prev = value
        }
    }
    
    return result
}

func convertArabianNumberToRome(arabianNumber: Int) -> String {
    var number = arabianNumber
    var result: [String] = []
    
    
    for (symbol, value) in decendingRomeSymbol {
        while number >= value {
            result.append(symbol)
            number -= value
        }
    }
    
    return result.joined()
}


let arabianResult = convertRomeNumberToArabian(romeNumber: firstRomeNumber) + convertRomeNumberToArabian(romeNumber: secondRomeNumber)
let romeResult = convertArabianNumberToRome(arabianNumber: arabianResult)

print(arabianResult, romeResult, separator: "\n")

