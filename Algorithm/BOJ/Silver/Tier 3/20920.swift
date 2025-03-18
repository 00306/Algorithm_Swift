//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 5/17/24.
//

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let m = input[1]
var words: [String] = []
var wordsDictionary: [String: Int] = [:]
var sortedWords: [String] = []

for _ in 0..<n {
    let word = readLine()!
    if word.count >= m {
        words.append(word)
        
        if wordsDictionary[word] == nil {
            wordsDictionary[word] = 1
        } else {
            wordsDictionary[word]! += 1
        }
    }
}



wordsDictionary
    .sorted(by: { $0.key < $1.key })
    .sorted(by: { $0.0.count > $1.0.count })
    .sorted(by: { $0.value > $1.value })
    .forEach { print($0.key) }

