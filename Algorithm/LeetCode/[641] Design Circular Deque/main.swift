//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 10/21/24.
//

class MyCircularDeque {
    private var elements: [Int?]
    private var maxSize: Int
    private var currentSize: Int
    private var front: Int
    private var rear: Int
    
    init(_ k: Int) {
        self.maxSize = k
        self.elements = Array(repeating: nil, count: maxSize)
        self.currentSize = 0
        self.front = 0
        self.rear = 0
    }
    
    func insertFront(_ value: Int) -> Bool {
        if isFull() { return false }
        
        front = (front - 1 + maxSize) % maxSize
        elements[front] = value
        currentSize += 1
        return true
    }
    
    func insertLast(_ value: Int) -> Bool {
        if isFull() { return false }
        
        elements[rear] = value
        rear = (rear + 1) % maxSize
        currentSize += 1
        return true
    }
    
    func deleteFront() -> Bool {
        if isEmpty() { return false }
        elements[front] = nil
        front = (front + 1) % maxSize
        currentSize -= 1
        return true
    }
    
    func deleteLast() -> Bool {
        if isEmpty() { return false }
        
        rear = (rear - 1 + maxSize) % maxSize
        elements[rear] = nil
        currentSize -= 1
        return true
    }
    
    func getFront() -> Int {
        if isEmpty() { return -1 }
        return elements[front] ?? -1
    }
    
    func getRear() -> Int {
        if isEmpty() { return -1 }
        let lastIndex = (rear - 1 + maxSize) % maxSize
        return elements[lastIndex] ?? -1
    }
    
    func isEmpty() -> Bool {
        return currentSize == 0
    }
    
    func isFull() -> Bool {
        return currentSize == maxSize
    }
}
