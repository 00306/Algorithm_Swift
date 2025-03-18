//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 10/31/24.
//

struct Heap<Element: Comparable> {
    private var elements: [Element]
    let sortingCriteria: (Element, Element) -> Bool
    
    init(sort: @escaping (Element, Element) -> Bool) {
        self.elements = []
        self.sortingCriteria = sort
    }
    
    var count: Int { elements.count }
    
    func parentIndex(of index: Int) -> Int { return (index - 1) / 2 }
    func leftChildIndex(of index: Int) -> Int { return 2 * index + 1 }
    func rightChildIndex(of index: Int) -> Int { return 2 * index + 2 }
    
    mutating func insert(_ element: Element) {
        elements.append(element)
        siftUp(from: count - 1)
    }
    
    mutating func delete() -> Element? {
        if elements.isEmpty { return nil }
        if elements.count == 1 { return elements.removeLast() }
        let value = elements[0]
        elements[0] = elements.removeLast()
        siftDown(from: 0)
        
        return value
    }
    
    mutating func siftUp(from index: Int) {
        var childIndex = index
        var parentIndex = parentIndex(of: childIndex)
        
        
        while childIndex > 0, sortingCriteria(elements[childIndex], elements[parentIndex]) {
            elements.swapAt(childIndex, parentIndex)
            childIndex = parentIndex
            parentIndex = self.parentIndex(of: childIndex)
        }
    }
    
    mutating func siftDown(from index: Int) {
        var parentIndex = index
        
        while true {
            let leftChildIndex = leftChildIndex(of: parentIndex)
            let rightChildIndex = rightChildIndex(of: parentIndex)
            var candidateIndex = parentIndex
            
            if leftChildIndex < count, sortingCriteria(elements[leftChildIndex], elements[candidateIndex]) {
                candidateIndex = leftChildIndex
            }
            
            if rightChildIndex < count, sortingCriteria(elements[rightChildIndex], elements[candidateIndex]) {
                candidateIndex = rightChildIndex
            }
            
            if parentIndex == candidateIndex { break }
            
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
    
    func enqueue(_ element: Element) { heap.insert(element) }
    
    func dequeue() -> Element? { heap.delete() }
}


let n = Int(readLine()!)!
let priorityQueue = PriorityQueue<Int>(sort: <)

for _ in 0..<n {
    let instruction = Int(readLine()!)!
    
    switch instruction {
        case 0:
            print(priorityQueue.dequeue() ?? 0)
        default:
            priorityQueue.enqueue(instruction)
            
    }
}
