//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/9/24.
//

let n = Int(readLine()!)!
var answer = 0

for _ in 0..<n {
    let word = readLine()!
    let set = Set(word)
    for char in set {
        if !(word.filter({ $0 == char }).count == word[word.firstIndex(of: char)!...word.lastIndex(of: char)!].count) {
            answer -= 1
            break
        }
    }
    
    answer += 1
    
}

print(answer)
