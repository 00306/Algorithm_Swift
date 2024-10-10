//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 12/11/24.
//

class Heap {
    private var elements: [Int] = []
    
    var count: Int { elements.count }
    
    func leftChildIndex(of index: Int) -> Int { 2*index+1 }
    func rightChildIndex(of index: Int) -> Int { 2*index+2 }
    func parentIndex(of index: Int) -> Int { return (index-1) / 2 }
    
    func insert(_ element: Int) {
        elements.append(element)
        siftUp(count - 1)
    }
    
    func pop() -> Int? {
        if elements.isEmpty { return nil }
        if count == 1 { return elements.removeFirst() }
        let max = elements[0]
        elements[0] = elements.removeLast()
        siftDown(0)
        
        return max
    }
    
    func siftUp(_ index: Int) {
        var currentIndex = index
        var parentIndex = parentIndex(of: currentIndex)
        
        
        while currentIndex >= 0 && elements[parentIndex] < elements[currentIndex] {
            let temp = elements[parentIndex]
            elements[parentIndex] = elements[currentIndex]
            elements[currentIndex] = temp
            
            currentIndex = parentIndex
            parentIndex = self.parentIndex(of: currentIndex)
        }
    }
    
    func siftDown(_ index: Int) {
        var parentIndex = index
        
        while true {
            let leftChildIndex = leftChildIndex(of: parentIndex)
            let rightChildIndex = rightChildIndex(of: parentIndex)
            var currentIndex = parentIndex
            
            if leftChildIndex < count, elements[leftChildIndex] > elements[currentIndex] {
                currentIndex = leftChildIndex
            }
            
            if rightChildIndex < count, elements[rightChildIndex] > elements[currentIndex] {
                currentIndex = rightChildIndex
            }
            
            if parentIndex == currentIndex { break }
            
            let temp = elements[currentIndex]
            elements[currentIndex] = elements[parentIndex]
            elements[parentIndex] = temp
            
            parentIndex = currentIndex
        }
    }
}

class Solution {
    let heap = Heap()
    
    func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
        var result = 0
        for num in nums { heap.insert(num) }
        for _ in 0..<k {
            if let maxValue = heap.pop() {
                result = maxValue
            }
        }
        
        return result
    }
}
