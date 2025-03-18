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

let VE = readLine()!.split(separator: " ").map { Int($0)! }
let V = VE[0]
let E = VE[1]

let start = Int(readLine()!)! - 1
var edges: [[Edge]] = Array(repeating: [], count: V)

for _ in 0..<E {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let u = input[0] - 1, v = input[1] - 1, w = input[2]
    
    edges[u].append(Edge(nextNode: v, weight: w))
}

func dijkstra(_ start: Int) -> [Int] {
    var dist = Array(repeating: Int.max, count: V)
    var heap = Heap<Edge>(sort: <)
    
    dist[start] = 0
    heap.insert(Edge(nextNode: start, weight: 0))
    
    while let edge = heap.pop() {
        let currentNode = edge.nextNode
        let currentWeight = edge.weight
        
        if currentWeight > dist[currentNode] { continue }
        
        for next in edges[currentNode] {
            let weight = next.weight + currentWeight
            
            if weight < dist[next.nextNode] {
                dist[next.nextNode] = weight
                heap.insert(Edge(nextNode: next.nextNode, weight: weight))
            }
        }
    }
    
    
    return dist
}

let dist = dijkstra(start)
for num in dist {
    print(num == Int.max ? "INF" : "\(num)")
}
