//
//  10942.swift
//  Algorithm
//
//  Created by 송지혁 on 6/20/25.
//

import Foundation

final class FileIO {
    private var buffer: [UInt8]
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

let file = FileIO()
let N = file.readInt()
var number: [Int] = []
for _ in 0..<N {
    number.append(file.readInt())
}

let M = file.readInt()
var dp = Array(repeating: [Int](repeating: 0, count: N), count: N)

for i in 0..<N {
    dp[i][i] = 1
}

for i in 0..<N-1 {
    if number[i] == number[i+1] {
        dp[i][i+1] = 1
    }
}

for length in 3...N {
    for i in 0...N-length {
        let j = i+length-1
        if number[i] == number[j] && dp[i+1][j-1] == 1 {
            dp[i][j] = 1
        }
    }
}

var result = ""

for _ in 0..<M {
    let S = file.readInt()
    let E = file.readInt()
    result.append("\(dp[S-1][E-1])\n")
}

print(result)
