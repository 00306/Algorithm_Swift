//
//  17609.swift
//  Algorithm
//
//  Created by 송지혁 on 10/28/25.
//

func checkPalindrome(of string: [Character], start: Int, end: Int) -> Bool {
    var left = start
    var right = end
    
    while left < right {
        if string[left] != string[right] { return false }
        
        left += 1
        right -= 1
    }
    
    return true
}

func checkPseudoPalindrome(of string: [Character]) -> Int {
    var left = 0
    var right = string.count - 1
    
    while left < right {
        if string[left] != string[right] {
            if checkPalindrome(of: string, start: left + 1, end: right) || checkPalindrome(of: string, start: left, end: right - 1) {
                return 1
            } else { return 2 }
        }
        
        left += 1
        right -= 1
    }
    
    return 2
}

func decidePalindromeType(of string: [Character]) -> Int {
    
    if checkPalindrome(of: string, start: 0, end: string.count-1) { return 0 }
    
    return checkPseudoPalindrome(of: string)

}

let T = Int(readLine()!)!
var result = ""

for _ in 0..<T {
    let string = readLine()!.map { $0 }
    
    result += "\(decidePalindromeType(of: string))\n"
}

print(result)
