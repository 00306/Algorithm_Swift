//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 1/30/26.
//

typealias Problem = (deadline: Int, reward: Int)

struct Heap {
    var array: [Problem] = []
    
    func leftChildIndex(of parentIndex: Int) -> Int { return 2 * parentIndex + 1 }
    func rightChildIndex(of parentIndex: Int) -> Int { return 2 * parentIndex + 2 }
    func parentIndex(of childIndex: Int) -> Int { return (childIndex - 1) / 2 }
    
    mutating func insert(_ problem: Problem) {
        array.append(problem)
        swim(array.endIndex-1)
    }
    
    mutating func pop() -> Problem? {
        if array.isEmpty { return nil }
        if array.count == 1 { return array.popLast() }
        
        let root = array[0]
        array[0] = array.removeLast()
        sink(0)
        
        return root
    }
    
    mutating func swim(_ childIndex: Int) {
        var currentIndex = childIndex
        
        while currentIndex > 0 {
            let parentIndex = parentIndex(of: currentIndex)
            
            if array[parentIndex].reward >= array[currentIndex].reward { break }
            
            array.swapAt(parentIndex, currentIndex)
            currentIndex = parentIndex
        }
    }
    
    mutating func sink(_ root: Int) {
        var parentIndex = root
        
        while true {
            var currentIndex = parentIndex
            let leftChildIndex = leftChildIndex(of: currentIndex)
            let rightChildIndex = rightChildIndex(of: currentIndex)
            
            if leftChildIndex < array.count, array[leftChildIndex].reward > array[currentIndex].reward {
                currentIndex = leftChildIndex
            }
            
            if rightChildIndex < array.count, array[rightChildIndex].reward > array[currentIndex].reward {
                currentIndex = rightChildIndex
            }
            
            if currentIndex == parentIndex { break }
            
            array.swapAt(parentIndex, currentIndex)
            
            parentIndex = currentIndex
        }
        
        
    }
    
}

struct PriorityQueue {
    var heap = Heap()
    
    mutating func enqueue(_ problem: Problem) {
        heap.insert(problem)
    }
    
    mutating func dequeue() -> Problem? {
        heap.pop()
    }
}

let N = Int(readLine()!)!
var priorityQueue = PriorityQueue()
var problems: [Problem] = []
var maxDeadline = 0
var result = 0

for _ in 0..<N {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let problem: Problem = (input[0], input[1])
    
    maxDeadline = max(maxDeadline, problem.deadline)
    
    problems.append(problem)
}

problems.sort(by: { $0.deadline > $1.deadline })


var i = 0

while maxDeadline > 0 {
    
    while i < problems.count {
        if problems[i].deadline < maxDeadline { break }
        priorityQueue.enqueue(problems[i])
        i += 1
    }
    
    if let max = priorityQueue.dequeue() {
        result += max.reward
    }
    
    
    maxDeadline -= 1
    
}


print(result)
