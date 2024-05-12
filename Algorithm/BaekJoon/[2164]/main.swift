//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 5/12/24.
//

class Queue<T> {
    private var array: [T] = []
    var index = 0
    
    func enqueue(_ element: T) {
        array.append(element)
    }
    
    func dequeue() -> T?  {
        defer {
            index += 1
        }
        
        return array[index]
    }
    
    var count: Int {
        array.count - index
    }
    
    var peek: T {
        array[index]
    }
}

let n = Int(readLine()!)!
let queue = Queue<Int>()
(1...n).forEach { queue.enqueue($0) }

while queue.count != 1 {
    let _ = queue.dequeue()
    queue.enqueue(queue.dequeue()!)
}

print(queue.peek)
