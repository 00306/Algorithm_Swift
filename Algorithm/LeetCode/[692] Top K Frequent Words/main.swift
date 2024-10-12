//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 12/12/24.
//

struct Heap<T> {
    private var elements: [T] = []
    let sort: (T, T) -> Bool
    
    init(sort: @escaping (T, T) -> Bool) {
        self.elements = []
        self.sort = sort
    }
    
    var count: Int { elements.count }
    private func leftChildIndex(of index: Int) -> Int { 2 * index + 1 }
    private func rightChildIndex(of index: Int) -> Int { 2 * index + 2 }
    private func parentIndex(of index: Int) -> Int { (index - 1) / 2 }
    
    mutating func insert(_ element: T) {
        elements.append(element)
        siftUp(from: count - 1)
    }
    
    mutating func pop() -> T? {
        if elements.isEmpty { return nil }
        if count == 1 { return elements.removeFirst() }
        
        let value = elements[0]
        elements[0] = elements.removeLast()
        siftDown(from: 0)
        
        return value
    }
    
    mutating func siftUp(from index: Int) {
        var currentIndex = index
        var parentIndex = parentIndex(of: currentIndex)
        
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
    var heap = Heap<(Int, String)>(sort: { lhs, rhs in
        if lhs.0 != rhs.0 { return lhs.0 > rhs.0 }
        return lhs.1 < rhs.1
    })
    func topKFrequent(_ words: [String], _ k: Int) -> [String] {
        var result: [String] = []
        var wordDictionary: [String: Int] = [:]
        
        for word in words { wordDictionary[word, default: 0] += 1 }
        for (word, count) in wordDictionary { heap.insert((count, word)) }
        
        for _ in 0..<k {
            let (_, word) = heap.pop()!
            result.append(word)
        }
        
        return result
    }
}
