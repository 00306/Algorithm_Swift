//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 10/31/24.
//

struct Heap<Element> where Element: Comparable, Element: SignedNumeric {
    private var elements: [Element]
    private let sortingCriteria: (Element, Element) -> Bool
    
    init(sort: @escaping (Element, Element) -> Bool) {
        self.elements = []
        self.sortingCriteria = sort
    }
    
    var count: Int { elements.count }
    private func parentIndex(of index: Int) -> Int { return (index - 1) / 2 }
    private func leftChildIndex(of index: Int) -> Int { return 2 * index + 1 }
    private func rightChildIndex(of index: Int) -> Int { return 2 * index + 2 }
    private func sortLogic(_ element1: Element, _ element2: Element) -> Bool {
        if abs(element1) < abs(element2) {
            return true
        } else if abs(element1) == abs(element2) {
            return element1 < element2
        } else { return false }
    }
    
    mutating func insert(_ element: Element) {
        elements.append(element)
        siftUp(from: count - 1)
    }
    
    mutating func delete() -> Element? {
        if elements.isEmpty { return nil }
        if count == 1 { return elements.removeLast() }
        let value = elements[0]
        elements[0] = elements.removeLast()
        siftDown(from: 0)
        
        return value
    }
    
    mutating private func siftUp(from index: Int) {
        var childIndex = index
        var parentIndex = parentIndex(of: childIndex)
        
        while childIndex > 0, sortLogic(elements[childIndex], elements[parentIndex]) {
            elements.swapAt(childIndex, parentIndex)
            childIndex = parentIndex
            parentIndex = self.parentIndex(of: childIndex)
        }
    }
    
    mutating private func siftDown(from index: Int) {
        var parentIndex = index
        
        while true {
            let leftChildIndex = leftChildIndex(of: parentIndex)
            let rightChildIndex = rightChildIndex(of: parentIndex)
            var candidateIndex = parentIndex
            
            if leftChildIndex < count, sortLogic(elements[leftChildIndex], elements[candidateIndex]) {
                candidateIndex = leftChildIndex
            }
            
            if rightChildIndex < count, sortLogic(elements[rightChildIndex], elements[candidateIndex]) {
                candidateIndex = rightChildIndex
            }
            
            if candidateIndex == parentIndex { break }
            
            elements.swapAt(parentIndex, candidateIndex)
            parentIndex = candidateIndex
        }
    }
}

class PriorityQueue<Element> where Element: Comparable, Element: SignedNumeric {
    private var heap: Heap<Element>
    
    init(sort: @escaping (Element, Element) -> Bool) {
        self.heap = Heap(sort: sort)
    }
    
    func enqueue(_ element: Element) { heap.insert(element) }
    
    func dequeue() -> Element? { heap.delete() }
    
}

let n = Int(readLine()!)!
let priorityQueue = PriorityQueue<Int>(sort: <=)
var result: [Int] = []

for _ in 0..<n {
    let instruction = Int(readLine()!)!
    
    switch instruction {
        case 0:
            result.append(priorityQueue.dequeue() ?? 0)
        default:
            priorityQueue.enqueue(instruction)
    }
}

result.forEach { print($0) }
