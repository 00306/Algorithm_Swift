//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 3/25/25.
//

struct Heap<Element: Comparable> {
    private var elements: [Element] = []
    
    func leftChildIndex(of parent: Int) -> Int { 2 * parent + 1 }
    func rightChildIndex(of parent: Int) -> Int { 2 * parent + 2 }
    func parentIndex(of child: Int) -> Int { (child - 1) / 2 }
    
    var top: Element? { elements.first }
    var count: Int { elements.count }
    
    mutating func push(_ element: Element) {
        elements.append(element)
        siftUp(of: elements.count - 1)
    }
    
    @discardableResult
    mutating func pop() -> Element? {
        if elements.isEmpty { return nil }
        if elements.count == 1 { return elements.removeFirst() }
        
        let result = elements.first!
        elements[0] = elements.removeLast()
        
        siftDown(of: 0)
        
        return result
        
    }
    
    private mutating func siftUp(of index: Int) {
        var parentIndex = parentIndex(of: index)
        var currentChildIndex = index
        
        while currentChildIndex != 0 && elements[parentIndex] > elements[currentChildIndex] {
            elements.swapAt(parentIndex, currentChildIndex)
            
            currentChildIndex = parentIndex
            parentIndex = self.parentIndex(of: currentChildIndex)
        }
    }
    
    private mutating func siftDown(of index: Int) {
        var parentIndex = index
        
        while parentIndex < elements.count {
            var needChangeIndex = parentIndex
            
            let leftChildIndex = leftChildIndex(of: parentIndex)
            let rightChildIndex = rightChildIndex(of: parentIndex)
            
            if leftChildIndex < elements.count,  elements[leftChildIndex] < elements[needChangeIndex] {
                needChangeIndex = leftChildIndex
            }
            
            if rightChildIndex < elements.count, elements[rightChildIndex] < elements[needChangeIndex] {
                needChangeIndex = rightChildIndex
            }
            
            if needChangeIndex == parentIndex { break }
            
            elements.swapAt(parentIndex, needChangeIndex)
            
            parentIndex = needChangeIndex
        }
    }
    
}

let n = Int(readLine()!)!
var schedules: [(Int, Int)] = []
var minHeap = Heap<Int>()

for _ in 0..<n {
    let schedule = readLine()!.split(separator: " ").map { Int($0)! }
    schedules.append((schedule[0], schedule[1]))
}

schedules.sort(by: { $0.0 < $1.0 })

for schedule in schedules {
    if let minEndTime = minHeap.top {
        if schedule.0 >= minEndTime {
            minHeap.pop()
        }
        
    }
    
    minHeap.push(schedule.1)
}

print(minHeap.count)
