//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 8/16/25.
//

let string = readLine()!.map { String($0) }

func isPalindrome(string: [String]) -> Bool {
    var left = 0
    var right = string.count - 1
    
    while left < right {
        if string[left] != string[right] { return false }
        left += 1
        right -= 1
    }
    
    return true
}

func isAllSame(string: [String]) -> Bool {
    for i in 1..<string.count {
        if string[0] != string[i] { return false }
    }
    
    return true
}

if !isPalindrome(string: string) { print(string.count) }
else if isAllSame(string: string) { print(-1) }
else { print(string.count - 1) }
