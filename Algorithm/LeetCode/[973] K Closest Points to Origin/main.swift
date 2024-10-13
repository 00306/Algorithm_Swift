//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 12/12/24.
//

struct Heap<Element> {
    private var elements: [Element]
    let sort: (Element, Element) -> Bool
    
    init(sort: @escaping (Element, Element) -> Bool) {
        self.elements = []
        self.sort = sort
    }
    
    var count: Int { elements.count }
    private func leftChildIndex(of index: Int) -> Int { 2 * index + 1 }
    private func rightChildIndex(of index: Int) -> Int { 2 * index + 2 }
    private func parentIndex(of index: Int) -> Int { (index - 1) / 2 }
    
    mutating func insert(_ element: Element) {
        elements.append(element)
        siftUp(from: count - 1)
    }
    
    mutating func pop() -> Element? {
        if elements.isEmpty { return nil }
        if count == 1 { return elements.removeFirst() }
        
        let value = elements[0]
        elements[0] = elements.removeLast()
        siftDown(from: 0)
        
        return value
    }
    
    mutating func siftUp(from index: Int) {
        var currentIndex = index
        var parentIndex = self.parentIndex(of: currentIndex)
        
        
        while parentIndex >= 0 && sort(elements[currentIndex], elements[parentIndex]) {
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
            
            if leftChildIndex < count,
                sort(elements[leftChildIndex], elements[currentIndex]) {
                currentIndex = leftChildIndex
            }
            
            if rightChildIndex < count,
                sort(elements[rightChildIndex], elements[currentIndex]) {
                currentIndex = rightChildIndex
            }
            
            if currentIndex == parentIndex { return }
            elements.swapAt(currentIndex, parentIndex)
            parentIndex = currentIndex
        }
    }
}

class Solution {
    var heap = Heap<(Int, Int)> { lhs, rhs in
        return (lhs.0 * lhs.0) + (lhs.1 * lhs.1) < (rhs.0 * rhs.0) + (rhs.1 * rhs.1)
    }
    
    func kClosest(_ points: [[Int]], _ k: Int) -> [[Int]] {
        var result: [[Int]] = []
        for point in points { heap.insert((point[0], point[1])) }
        
        for _ in 0..<k {
            let (x, y) = heap.pop()!
            let point = [x, y]
            result.append(point)
        }
        
        return result
    }
}
