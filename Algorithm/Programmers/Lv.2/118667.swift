//
//  118667.swift
//  Algorithm
//
//  Created by 송지혁 on 5/28/26.
//

import Foundation

struct Queue {
    var elements: [Int] = []
    var head = 0
    
    init(_ elements: [Int]) {
        self.elements = elements
    }
    
    mutating func insert(_ element: Int) {
        elements.append(element)
    }
    
    mutating func pop() -> Int? {
        if elements.isEmpty { return nil }
        if head >= elements.count { return nil }
        
        let element = elements[head]
        head += 1
        
        return element
    }
    
    func all() -> [Int] {
        return Array(elements[head...])
    }
}

func solution(_ queue1: [Int], _ queue2: [Int]) -> Int {
    let sum = queue1.reduce(0, +) + queue2.reduce(0, +)
    if sum % 2 == 1 { return -1 }
    let mid = sum / 2
    
    var currentQueue1 = Queue(queue1)
    var currentQueue2 = Queue(queue2)
    
    var queue1Sum = queue1.reduce(0, +)
    var queue2Sum = queue2.reduce(0, +)
    var result = 0
    
    while queue1Sum != queue2Sum {
        result += 1
        
        if queue1Sum > mid {
            let digit = currentQueue1.pop()!
            currentQueue2.insert(digit)
            
            queue1Sum -= digit
            queue2Sum += digit
        } else if queue2Sum > mid {
            let digit = currentQueue2.pop()!
            currentQueue1.insert(digit)
            
            queue2Sum -= digit
            queue1Sum += digit
        }
        
        if result > queue1.count * 3 {
            result = -1
            break
        }
    }
    
    return result
}
