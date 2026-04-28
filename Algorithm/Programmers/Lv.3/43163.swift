//
//  43163.swift
//  Algorithm
//
//  Created by 송지혁 on 4/28/26.
//

import Foundation

func solution(_ begin: String, _ target: String, _ words: [String]) -> Int {
    var result = 0
    
    var queue: [(String, Int)] = [(begin, 0)]
    var visited = [Bool](repeating: false, count: words.count)
    var head = 0
    
    while head < queue.count {
        let currentWord = queue[head].0
        let path = queue[head].1
        head += 1
        
        if currentWord == target {
            result = path
            break
        }
        
        let currentWordArray = currentWord.map { $0 }
        
        for (i, word) in words.enumerated() {
            if visited[i] { continue }
            
            var count = 0
            let wordArray = word.map { $0 }
            
            for j in 0..<word.count {
                if currentWordArray[j] == wordArray[j] {
                    count += 1
                }
            }
            
            if count == currentWord.count - 1 {
                visited[i] = true
                queue.append((word, path+1))
            }
        }
    }
    
    return result
}
