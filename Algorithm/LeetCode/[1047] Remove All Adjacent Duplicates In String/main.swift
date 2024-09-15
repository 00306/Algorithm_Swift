//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 10/21/24.
//

struct Stack<T> {
    private(set) var elements: [T] = []
    
    mutating func push(_ element: T) {
        elements.append(element)
    }
    
    @discardableResult
    mutating func pop() -> T? {
        elements.removeLast()
    }
    
    var top: T? { elements.last }
    var isEmpty: Bool { elements.isEmpty }
    var count: Int { elements.count }
}

class Solution {
    func removeDuplicates(_ s: String) -> String {
        var stack = Stack<Character>()
        var result: [Character] = []
        
        for char in s {
            if let top = stack.top, top == char { stack.pop() }
            else { stack.push(char) }
        }
        
        while !stack.isEmpty {
            result.append(stack.pop()!)
        }
        
        result.reverse()
        return String(result)
    }
}
