//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 3/22/25.
//

func powerOf(_ n: Int, scale: Int) -> Int {
    var result = 1
    
    for _ in 0..<scale {
        result *= n
    }
    
    return result
}

let n = Int(readLine()!)!
var alphabetWeight: [Character: Int] = [:]
var result = 0

for _ in 0..<n {
    let word = readLine()!
    var digits = powerOf(10, scale: word.count-1)
    
    for alphabet in word {
        alphabetWeight[alphabet, default: 0] += digits
        digits /= 10
    }
}

var count = 9
for (_, value) in alphabetWeight.sorted(by: { $0.value > $1.value }) {
    result += value * count
    count -= 1
}

print(result)
