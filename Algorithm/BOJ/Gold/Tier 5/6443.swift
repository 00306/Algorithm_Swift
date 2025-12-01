//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 12/1/25.
//

let N = Int(readLine()!)!
var result = ""

for _ in 0..<N {
    let word = readLine()!.map { $0 }.sorted()
    let anagrams = findAllAnagram(word: word)
    
    anagrams.forEach {
        result += "\($0)\n"
    }
}

print(result)


func findAllAnagram(word: [Character]) -> [String] {
    var combinations: [String] = []
    var visited = Array(repeating: false, count: word.count)
    
    func recursion(part: [Character]) {
        if part.count == word.count {
            combinations.append(String(part))
            return
        }
        
        var lastChar: Character?
        
        for i in 0..<word.count {
            if visited[i] { continue }
            if let lastChar = lastChar, lastChar == word[i] { continue }
            visited[i] = true
            lastChar = word[i]
            recursion(part: part + [word[i]])
            visited[i] = false
        }
    }
    
    recursion(part: [])
    
    return combinations
}
