//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/8/24.
//

let S = readLine()!
var alphabet_dictionary: [String: Int] = [:]
var answer = ""

for alphabet in "abcdefghijklmnopqrstuvwxyz" {
    alphabet_dictionary[String(alphabet)] = -1
}

for i in 0..<S.count {
    let currentChar = S[String.Index(utf16Offset: i, in: S)]
    
    if alphabet_dictionary[String(currentChar)] == -1 {
        alphabet_dictionary[String(currentChar)] = i
    }
}

alphabet_dictionary.sorted(by: { $0.key < $1.key }).forEach { print("\($0.value)", terminator: " ") }


