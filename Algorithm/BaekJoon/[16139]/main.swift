//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 6/22/24.
//

let string = readLine()!.map { $0 }
let q = Int(readLine()!)!
var alphabetDictionary: [String: [Int]] = [:]

var result = ""

for i in Character("a").asciiValue!...Character("z").asciiValue! {
    var array = Array(repeating: 0, count: string.count + 1)
    if string[0].asciiValue! == i { array[0] = 1 }
    
    for j in 1..<string.count {
        let charAscii = string[j].asciiValue!
        
        if charAscii == i {
            array[j] = array[j-1] + 1
        } else {
            array[j] = array[j-1]
        }
    }
    
    alphabetDictionary[String(UnicodeScalar(i)), default: []] = array
}

for _ in 0..<q {
    let input = readLine()!.split(separator: " ").map { String($0) }
    let alphabet = input[0]
    let startIndex = Int(input[1])!
    let endIndex = Int(input[2])!
    let dictionary = alphabetDictionary[alphabet]!
    
    result += "\(dictionary[endIndex] - (startIndex == 0 ? 0 : dictionary[startIndex-1]))\n"
    
}

print(result)






