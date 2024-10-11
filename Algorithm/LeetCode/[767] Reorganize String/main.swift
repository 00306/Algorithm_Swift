//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 12/11/24.
//

class Heap {
    private var elements: [(Int, Character)] = []
    
    func leftChildIndex(of index: Int) -> Int { 2*index+1 }
    func rightChildIndex(of index: Int) -> Int { 2*index+2 }
    func parentIndex(of index: Int) -> Int { (index-1) / 2 }
    var count: Int { elements.count }
    var isEmpty: Bool { elements.isEmpty }
    
    func insert(_ element: (Int, Character)) {
        elements.append(element)
        siftUp(from: count - 1)
    }
    
    func pop() -> (Int, Character)? {
        if elements.isEmpty { return nil }
        if elements.count == 1 { return elements.removeFirst() }
        let value = elements[0]
        elements[0] = elements.removeLast()
        siftDown(from: 0)
        
        return value
    }
    
    func siftUp(from index: Int) {
        var currentIndex = index
        let value = elements[currentIndex]
        var parentIndex = parentIndex(of: currentIndex)
        
        while currentIndex > 0 && elements[currentIndex].0 > elements[parentIndex].0 {
            let temp = elements[currentIndex]
            elements[currentIndex] = elements[parentIndex]
            elements[parentIndex] = temp
            currentIndex = parentIndex
            parentIndex = self.parentIndex(of: currentIndex)
        }
    }
    
    func siftDown(from index: Int) {
        var parentIndex = index
        
        while true {
            var leftChildIndex = leftChildIndex(of: parentIndex)
            var rightChildIndex = rightChildIndex(of: parentIndex)
            var currentIndex = parentIndex
            
            if leftChildIndex < count, elements[leftChildIndex].0 > elements[currentIndex].0 {
                currentIndex = leftChildIndex
            }
            
            if rightChildIndex < count, elements[rightChildIndex].0 > elements[currentIndex].0
            {
                currentIndex = rightChildIndex
            }
            
            if currentIndex == parentIndex { break }
            
            let temp = elements[parentIndex]
            elements[parentIndex] = elements[currentIndex]
            elements[currentIndex] = temp
            parentIndex = currentIndex
        }
    }
    
}

class Solution {
    let heap = Heap()
    
    func reorganizeString(_ s: String) -> String {
        var result: [Character] = []
        var charDictionary: [Character: Int] = [:]
        var prev: (Int, Character)? = nil
        
        for char in s { charDictionary[char, default: 0] += 1 }
        for (char, count) in charDictionary { heap.insert((count, char)) }
        
        while !heap.isEmpty {
            let (count, char) = heap.pop()!
            if let prev, prev.0 > 0 {
                heap.insert(prev)
            }
            
            result.append(char)
            
            
            let newCount = count - 1
            prev = (newCount, char)
        }
        
        dump(prev)
        if let prev, prev.0 > 0 { return "" }
        
        return String(result)
    }
}
