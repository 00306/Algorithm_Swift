//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 5/18/24.
//

let t = Int(readLine()!)!

for _ in 0..<t {
    let word = readLine()!.map { String($0) }
    let result = isPalindrome(word, l: 0, r: word.count - 1, count: 1)
    print(result.0, result.1)
}

func isPalindrome(_ word: [String], l: Int, r: Int, count: Int) -> (Int, Int) {
    
    if l >= r { return (1, count) }
    else if word[l] != word[r] { return (0, count) }
    
    return isPalindrome(word, l: l+1, r: r-1, count: count+1)
}
