//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 12/16/24.
//

import Foundation

final class FileIO {
    private var buffer:[UInt8]
    private var index: Int
    
    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(fileHandle.readDataToEndOfFile())+[UInt8(0)]
        index = 0
    }
    
    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }
        
        return buffer.withUnsafeBufferPointer { $0[index] }
    }
    
    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true
        
        while now == 10
                || now == 32 { now = read() }
        if now == 45{ isPositive.toggle(); now = read() }
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
                || now == 32 { now = read() }
        
        while now != 10
                && now != 32 && now != 0 {
            str += String(bytes: [now], encoding: .ascii)!
            now = read()
        }
        
        return str
    }
}

let fileIO = FileIO()
let T = fileIO.readInt()
var result = ""

for _ in 0..<T {
    let n = fileIO.readInt()
    var grades: [(Int, Int)] = []
    
    for _ in 0..<n {
        let grade = (fileIO.readInt(), fileIO.readInt())
        grades.append(grade)
    }
    
    grades.sort { $0.0 < $1.0 }
    
    var maxInterViewGrade = grades[0].1
    var count = 1
    
    for i in 1..<grades.count {
        if grades[i].1 < maxInterViewGrade {
            count += 1
            maxInterViewGrade = grades[i].1
        }
    }
    
    result += "\(count)\n"
}

print(result)
