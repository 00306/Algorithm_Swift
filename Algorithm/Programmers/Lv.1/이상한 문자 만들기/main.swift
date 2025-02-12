//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 2/12/25.
//

import Foundation

func solution(_ s: String) -> String {
    var answer = ""
    let startIndex = answer.startIndex
    var currentWordIndex = 0
    
    for char in s {
        var character = String(char)
        
        if char == " " {  currentWordIndex = -1 }
        else if currentWordIndex % 2 == 0 { character = char.uppercased() }
        else { character = char.lowercased() }
        
        currentWordIndex += 1
        answer += character
    }
    
    return answer
}
