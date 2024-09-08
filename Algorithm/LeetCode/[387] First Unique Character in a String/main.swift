//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 10/16/24.
//

class Solution {
    func firstUniqChar(_ s: String) -> Int {
        var characterDictionary: [Character: Int] = [:]
        var result = -1
        
        for char in s {
            characterDictionary[char, default: 0] += 1
        }
        
        for (index, char) in s.enumerated() {
            if characterDictionary[char]! == 1 { return index }
        }
        
        return result
    }
}
