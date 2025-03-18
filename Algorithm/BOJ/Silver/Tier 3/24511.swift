//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 5/14/24.
//

import Foundation

final class FileIO {
    private let buffer: Data
    private var index: Int = 0
    
    init(fileHandle: FileHandle = FileHandle.standardInput) {
        self.buffer = try! fileHandle.readToEnd()! // 인덱스 범위 넘어가는 것 방지
    }
    
    @inline(__always) private func read() -> UInt8 {
        defer {
            index += 1
        }
        guard index < buffer.count else { return 0 }
        
        return buffer[index]
    }
    
    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true
        
        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45 { isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }
        
        return sum * (isPositive ? 1:-1)
    }
    
    
    @inline(__always) func readString() -> String {
        var str = ""
        var now = read()
        
        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        
        while now != 10
                && now != 32 && now != 0 {
            str += String(bytes: [now], encoding: .ascii)!
            now = read()
        }
        
        return str
    }
}

class Queue<T> {
    private var array: [T] = []
    var index = 0
    
    init() {}
    
    init(_ element: T) {
        enqueue(element)
    }
    
    func enqueue(_ element: T) {
        array.append(element)
    }
    
    func dequeue() -> T? {
        defer {
            index += 1
        }
        
        return array[index]
    }
    
    func reverse() {
        array = array.reversed()
    }
    
    func popLast() -> T? {
        array.popLast()
    }
    
    var isEmpty: Bool {
        array[index...].isEmpty
    }
    
    var peek: T? {
        array[index]
    }
    
    var count: Int {
        array.count - index
    }
}

let fileIO = FileIO()

var queue = Queue<Int>()

let n = fileIO.readInt()

var structureArray: [Int] = []


for _ in 0..<n {
    structureArray.append(fileIO.readInt())
    
}

var numArray: [Int] = []

for _ in 0..<n {
    numArray.append(fileIO.readInt())
}


let insertCount = fileIO.readInt()
var insertNums: [Int] = []

for _ in 0..<insertCount {
    insertNums.append(fileIO.readInt())
}

var result = ""

for i in 0..<n {
    if structureArray[i] == 0 {
        queue.enqueue(numArray[i])
    }
}

if queue.count == 0 {
    insertNums.forEach { result += "\($0) " }
} else {
    for num in insertNums {
        result += "\(queue.popLast()!) "
        queue.enqueue(num)
        queue.reverse()
    }
}

print(result)
