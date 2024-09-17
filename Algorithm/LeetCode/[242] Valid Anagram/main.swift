//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 10/21/24.
//

class Solution {
    func isAnagram(_ s: String, _ t: String) -> Bool {
        if s.count != t.count { return false }
        var sDictionary: [Character: Int] = [:]
        var tDictionary: [Character: Int] = [:]
        
        for char in s {
            sDictionary[char, default: 0] += 1
        }
        
        for char in t {
            tDictionary[char, default: 0] += 1
        }
        
        for char in s {
            if tDictionary[char] == nil { return false }
            if tDictionary[char]! != sDictionary[char]! { return false }
        }
        
        for char in t {
            if sDictionary[char] == nil { return false }
            if tDictionary[char]! != sDictionary[char]! { return false }
        }
        
        return true
    }
}
