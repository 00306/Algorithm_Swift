//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 10/29/24.
//

struct Heap<Element: Comparable> {
    private var elements: [Element]
    private var sortCriteria: (Element, Element) -> Bool
    
    init(sort: @escaping (Element, Element) -> Bool) {
        self.elements = []
        self.sortCriteria = sort
    }
    
    var isEmpty: Bool { elements.isEmpty }
    
    var count: Int { elements.count }
    
    func peek() -> Element? { elements.first }
    
    private func parentIndex(of index: Int) -> Int { return (index - 1) / 2 }
    
    private func leftChildIndex(of index: Int) -> Int { return 2 * index + 1 }
    
    private func rightChildIndex(of index: Int) -> Int { return 2 * index + 2 }
    
    mutating func insert(_ element: Element) {
        elements.append(element)
        siftUp(from: elements.count - 1)
    }
    
    mutating func remove() -> Element? {
        if elements.isEmpty { return nil }
        
        if elements.count == 1 { return elements.removeFirst() }
        else {
            let value = elements.first
            elements[0] = elements.removeLast()
            siftDown(from: 0)
            return value
        }
    }
    
    mutating func siftUp(from index: Int) {
        var childIndex = index
        let childValue = elements[index]
        
        var parentIndex = parentIndex(of: childIndex)
        
        while childIndex > 0 && sortCriteria(childValue, elements[parentIndex]) {
            elements[childIndex] = elements[parentIndex]
            childIndex = parentIndex
            
            parentIndex = self.parentIndex(of: childIndex)
        }
        
        elements[childIndex] = childValue
    }
    
    mutating func siftDown(from index: Int) {
        var parentIndex = index
        let parentValue = elements[index]
        let count = elements.count
        
        while true {
            let leftIndex = leftChildIndex(of: parentIndex)
            let rightIndex = rightChildIndex(of: parentIndex)
            var candidateIndex = parentIndex
            
            if leftIndex < count && sortCriteria(elements[leftIndex], elements[candidateIndex]) {
                candidateIndex = leftIndex
            }
            
            if rightIndex < count, sortCriteria(elements[rightIndex], elements[candidateIndex]) {
                candidateIndex = rightIndex
            }
            
            if candidateIndex == parentIndex { break }
            
            elements.swapAt(parentIndex, candidateIndex)
            parentIndex = candidateIndex
        }
    }
}

class PriorityQueue<Element: Comparable> {
    private var heap: Heap<Element>
    
    init(sort: @escaping (Element, Element) -> Bool) {
        self.heap = Heap(sort: sort)
    }
    
    func enqueue(_ element: Element) {
        heap.insert(element)
    }
    
    func dequeue() -> Element? {
        heap.remove()
    }
}

let x = Int(readLine()!)!
var result: [Int] = []
let priorityQueue = PriorityQueue<Int>(sort: >)

for _ in 0..<x {
    let instruction = Int(readLine()!)!
    
    switch instruction {
        case 0:
            let value = priorityQueue.dequeue() ?? 0
            result.append(value)
        default:
            priorityQueue.enqueue(instruction)
    }
    
}

for num in result {
    print(num)
}
