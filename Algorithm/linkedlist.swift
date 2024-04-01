//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 3/7/24.
//

import Foundation

class Node {
    var data: Int
    var next: Node?
    
    init(_ data: Int, _ next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

class LinkList {
    private var head: Node?
    
    func addFront(_ data: Int) {
        let newNode = Node(data)
        newNode.next = head
        head = newNode
    }
    
    func addBack(_ data: Int) {
        let newNode = Node(data)
        
        if head == nil {
            head = newNode
            return
        }
        
        var node = head!
        while node.next != nil {
            node = node.next!
        }
        
        node.next = newNode
    }
    
    func insert(position: Int, data: Int) {
        if position == 0 {
            addFront(data)
            return
        }
        let newNode = Node(data)
        var currentNode = head
        
        for i in 0..<position - 1 {
            if currentNode?.next == nil {
                addBack(data)
                return
            }
            
            currentNode = currentNode?.next!
        }
        
        newNode.next = currentNode?.next
        currentNode?.next! = newNode
    }
    
    func deleteFirst() {
        head = head?.next
    }
    
    func deleteLast() {
        var currentNode = head
        var previousNode: Node?
        
        while currentNode?.next != nil {
            previousNode = currentNode
            currentNode = currentNode?.next
        }
        
        previousNode?.next = nil
    }
    
    func delete(at position: Int) {
        if position == 0 {
            deleteFirst()
            return
        }
        
        var currentNode = head
        var previousNode: Node?
        
        for i in 0..<position {
            previousNode = currentNode
            currentNode = currentNode?.next
        }
        
        previousNode?.next = currentNode?.next
    }
    
    var isEmpty: Bool {
        head == nil
    }
    
    func removeAll() {
        head = nil
    }
    
    func getFirst() -> Int? {
        if head == nil { return nil }
        return head!.data
    }
    
    func getLast() -> Int? {
        if head == nil { return nil }
        
        var node = head!
        while node.next != nil {
            node = node.next!
        }
        
        return node.data
    }
    
    func printAll() {
        if head == nil { return print("[]")  }
        var result = [Int]()
        var node = head
        result.append(node!.data)
        
        while node?.next != nil {
            result.append(node!.next!.data)
            node = node?.next
        }
        
        print(result)
    }
}
