//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 5/13/24.
//

class Queue<T> {
    private var array: [T] = []
    var index = 0
    
    func enqueue(_ element: T) {
        array.append(element)
    }
    
    func dequeue() -> T? {
        defer {
            index += 1
        }
        
        return array[index]
    }
    
    var count: Int {
        array.count - index
    }
    
    var isEmpty: Bool {
        array[index...].isEmpty
    }
    
    var peek: T? {
        array[index]
    }
}

let input = readLine()!.split(separator: " ").map { Int($0)! }
let peopleCount = input[0]
let removeNumber = input[1]
var queue = Queue<Int>()

var result: [String] = []

for i in 1...peopleCount {
    queue.enqueue(i)
}

while queue.count != 0 {
    for _ in 0..<removeNumber-1 {
        queue.enqueue(queue.dequeue()!)
    }
    
    result.append(String(queue.dequeue()!))
}

print("<\(result.joined(separator: ", "))>")
