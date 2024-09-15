//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 10/20/24.
//

struct Stack<T> {
    private var elements: [T] = []
    
    mutating func push(_ element: T) { elements.append(element) }
    
    @discardableResult
    mutating func pop() -> T? { elements.removeLast() }
    
    var peek: T? { elements.last }
    
    var isEmpty: Bool { elements.isEmpty }
    
    var count: Int { elements.count }
}

class Solution {
    func isValid(_ s: String) -> Bool {
        var stack = Stack<Character>()
        let matchedBracket: [Character: Character] = [
            ")": "(",
            "}": "{",
            "]": "["
        ]
        
        for char in s {
            if char == "(" || char == "{" || char == "[" { stack.push(char) }
            else if let peek = stack.peek, matchedBracket[char] == peek { stack.pop() }
            else { return false }
        }
        
        return stack.isEmpty
    }
}
