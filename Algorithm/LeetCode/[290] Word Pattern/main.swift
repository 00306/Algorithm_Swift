//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 10/21/24.
//

class Solution {
    func wordPattern(_ pattern: String, _ s: String) -> Bool {
        var patternDictionary: [Character: String] = [:]
        var matchedStringDictionary: [String: Character] = [:]
        let stringArray = s.split(separator: " ").map { String($0) }
        
        if pattern.count != stringArray.count { return false }
        
        for i in 0..<pattern.count {
            let charIndex = pattern.index(pattern.startIndex, offsetBy: i)
            let patternChar = pattern[charIndex]
            let matchedString = stringArray[i]
            
            
            if let value = patternDictionary[patternChar], value != matchedString { return false }
            if let value = matchedStringDictionary[matchedString], value != patternChar { return false }
            
            matchedStringDictionary[matchedString] = patternChar
            patternDictionary[patternChar] = matchedString
        }
        return true
    }
}
