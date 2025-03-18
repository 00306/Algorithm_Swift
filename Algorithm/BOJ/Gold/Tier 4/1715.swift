//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 12/16/24.
//

struct Heap<Element> {
    private var elements: [Element]
    let sort: (Element, Element) -> Bool
    
    init(sort: @escaping (Element, Element) -> Bool) {
        self.elements = []
        self.sort = sort
    }
    
    var isEmpty: Bool { elements.isEmpty }
    var count: Int { elements.count }
    func leftChildIndex(of index: Int) -> Int { 2 * index + 1 }
    func rightChildIndex(of index: Int) -> Int { 2 * index + 2 }
    func parentIndex(of index: Int) -> Int { (index - 1) /  2 }
    
    mutating func insert(_ element: Element) {
        elements.append(element)
        siftUp(from: count - 1)
    }
    
    mutating func pop() -> Element? {
        if elements.isEmpty { return nil }
        if elements.count == 1 { return elements.removeFirst() }
        
        let value = elements[0]
        elements[0] = elements.removeLast()
        siftDown(from: 0)
        
        return value
    }
    
    mutating func siftUp(from index: Int) {
        var currentIndex = index
        var parentIndex = parentIndex(of: currentIndex)
        
        while parentIndex >= 0, sort(elements[currentIndex], elements[parentIndex]) {
            elements.swapAt(currentIndex, parentIndex)
            
            currentIndex = parentIndex
            parentIndex = self.parentIndex(of: currentIndex)
        }
    }
    
    mutating func siftDown(from index: Int) {
        var parentIndex = index
        
        while true {
            let leftChildIndex = leftChildIndex(of: parentIndex)
            let rightChildIndex = rightChildIndex(of: parentIndex)
            var currentIndex = parentIndex
            
            if leftChildIndex < count, sort(elements[leftChildIndex], elements[currentIndex]) {
                currentIndex = leftChildIndex
            }
            
            if rightChildIndex < count, sort(elements[rightChildIndex], elements[currentIndex]) {
                currentIndex = rightChildIndex
            }
            
            if currentIndex == parentIndex { break }
            
            elements.swapAt(currentIndex, parentIndex)
            parentIndex = currentIndex
        }
    }
}

let n = Int(readLine()!)!
var result = 0
var heap = Heap<Int>(sort: <)

for _ in 0..<n {
    let card = Int(readLine()!)!
    heap.insert(card)
}

while !heap.isEmpty {
    guard let first = heap.pop(), let second = heap.pop() else { break }
    let sum = first + second
    result += sum
    heap.insert(sum)
}

print(result)

