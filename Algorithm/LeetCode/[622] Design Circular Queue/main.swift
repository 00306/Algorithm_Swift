//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 10/21/24.
//


class MyCircularQueue {
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
        self.rear = -1
    }
    
    func enQueue(_ value: Int) -> Bool {
        if isFull() { return false }
        rear = (rear + 1) % maxSize
        elements[rear] = value
        currentSize += 1
        
        return true
    }
    
    func deQueue() -> Bool {
        if isEmpty() { return false }
        elements[front] = nil
        front = (front + 1) % maxSize
        currentSize -= 1
        
        return true
    }
    
    func Front() -> Int {
        if isEmpty() { return -1 }
        return elements[front] ?? -1
    }
    
    func Rear() -> Int {
        if isEmpty() { return -1 }
        return elements[rear] ?? -1
    }
    
    func isEmpty() -> Bool {
        currentSize == 0
    }
    
    func isFull() -> Bool {
        currentSize == maxSize
    }
}
