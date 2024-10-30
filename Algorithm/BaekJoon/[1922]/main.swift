//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 12/17/24.
//

struct Heap<Element> {
    private var elements: [Element]
    let sort: (Element, Element) -> Bool
    
    init(sort: @escaping (Element, Element) -> Bool) {
        self.elements = []
        self.sort = sort
    }
    
    var count: Int { elements.count }
    func leftChildIndex(of index: Int) -> Int { 2 * index + 1 }
    func rightChildIndex(of index: Int) -> Int { 2 * index + 2 }
    func parentIndex(of index: Int) -> Int { (index - 1) / 2 }
    
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

struct Edge: Comparable {
    let nextNode: Int
    let weight: Int
    
    static func < (lhs: Edge, rhs: Edge) -> Bool {
        return lhs.weight < rhs.weight
    }
}

let n = Int(readLine()!)!
let m = Int(readLine()!)!

var graph: [[Edge]] = Array(repeating: [], count: n)

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let u = input[0] - 1
    let v = input[1] - 1
    
    graph[u].append(Edge(nextNode: v, weight: input[2]))
    graph[v].append(Edge(nextNode: u, weight: input[2]))
}

func prim(_ start: Int) -> Int {
    var visited = Array(repeating: false, count: n)
    var minHeap = Heap<Edge> { $0.weight < $1.weight }
    var cost = 0
    
    visited[start] = true
    for edge in graph[start] {
        minHeap.insert(edge)
    }
    
    while let node = minHeap.pop() {
        let nextNode = node.nextNode
        if visited[nextNode] { continue }
        visited[nextNode] = true
        cost += node.weight
        
        for edge in graph[nextNode] where !visited[edge.nextNode] {
            minHeap.insert(edge)
        }
    }
    
    return cost
}

print(prim(0))
