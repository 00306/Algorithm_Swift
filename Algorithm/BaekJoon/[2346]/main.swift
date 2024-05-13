//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 5/13/24.
//

class Deque<T> {
    private var enqueue: [T] = []
    private var dequeue: [T] = []
    
    var count: Int {
        enqueue.count + dequeue.count
    }
    
    var isEmpty: Bool {
        enqueue.isEmpty && dequeue.isEmpty
    }
    
    var first: T? {
        dequeue.isEmpty ? enqueue.first : dequeue.last
    }
    
    func pushFirst(_ n: T) {
        dequeue.append(n)
    }
    
    func pushLast(_ n: T) {
        enqueue.append(n)
    }
    
    func popFirst() -> T? {
        if dequeue.isEmpty {
            dequeue = enqueue.reversed()
            enqueue.removeAll()
        }
        
        return dequeue.popLast()
    }
    
    func popLast() -> T? {
        if enqueue.isEmpty {
            enqueue = dequeue.reversed()
            dequeue.removeAll()
        }
        
        return enqueue.popLast()
    }
    
    
}


let n = Int(readLine()!)!
var input = readLine()!.split(separator: " ").enumerated().map { ($0+1, Int($1)!) }
var deque = Deque<(Int, Int)>()
var result: [String] = []
input.forEach { deque.pushLast($0) }

while true {
    let removeElement = deque.popFirst()!
    result.append(String(removeElement.0))
    if deque.count == 0 { break }
    
    if removeElement.1 > 0 {
        for _ in 0..<removeElement.1 - 1 {
            deque.pushLast(deque.popFirst()!)
        }
    } else {
        for _ in 0..<abs(removeElement.1) {
            deque.pushFirst(deque.popLast()!)
        }
    }
}


print(result.joined(separator: " "))
