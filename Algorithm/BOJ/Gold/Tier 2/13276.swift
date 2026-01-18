//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 1/16/26.
//

import Foundation

final class FileIO {
    private let buffer:[UInt8]
    private var index: Int = 0
    
    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(try! fileHandle.readToEnd()!) + [UInt8(0)]
    }
    
    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }
        return buffer[index]
    }
    
    @inline(__always) func readString() -> [UInt8] {
        var str = [UInt8]()
        var now = read()
        while now == 10 || now == 32 { now = read() }
        while now != 10 && now != 32 && now != 0 {
            str.append(now)
            now = read()
        }
        return str
    }
}

let file = FileIO()
let s = file.readString()
let prefix = file.readString()
let suffix = file.readString()

func makePi(pattern: [UInt8]) -> [Int] {
    var j = 0
    var pi = Array(repeating: 0, count: pattern.count)
    for i in 1..<pattern.count {
        while j > 0, pattern[i] != pattern[j] { j = pi[j-1] }
        if pattern[i] == pattern[j] {
            j += 1
            pi[i] = j
        }
    }
    return pi
}

func kmpSearch(text: [UInt8], pattern: [UInt8]) -> [Int] {
    if pattern.isEmpty { return [] }
    var j = 0
    let pi = makePi(pattern: pattern)
    var result: [Int] = []
    
    for i in 0..<text.count {
        while j > 0, text[i] != pattern[j] { j = pi[j-1] }
        if text[i] == pattern[j] {
            if j == pattern.count - 1 {
                result.append(i - pattern.count + 1)
                j = pi[j]
            } else { j += 1 }
        }
    }
    return result
}

let MOD: UInt64 = 1_000_000_007
let P: UInt64 = 31

var power = Array(repeating: UInt64(1), count: s.count + 1)
var pHash = Array(repeating: UInt64(0), count: s.count + 1)

for i in 0..<s.count {
    power[i+1] = (power[i] * P) % MOD
    pHash[i+1] = (pHash[i] * P + UInt64(s[i])) % MOD
}

@inline(__always) func getSubstrHash(start: Int, end: Int) -> UInt64 {
    let len = end - start + 1
    let head = pHash[end+1]
    let tail = (pHash[start] * power[len]) % MOD
    
    if head >= tail {
        return (head - tail) % MOD
    } else {
        return (head + MOD - tail) % MOD
    }
}

func getValidNumber(length: Int, indexies: [Int]) -> Int {
    var start = 0
    var end = indexies.count
    while start < end {
        let mid = (start + end) / 2
        if indexies[mid] >= length {
            end = mid
        } else {
            start = mid + 1
        }
    }
    return end
}

let prefixIndicies = kmpSearch(text: s, pattern: prefix)
let suffixIndicies = kmpSearch(text: s, pattern: suffix)

var resultSet = Set<UInt64>(minimumCapacity: prefixIndicies.count * 2)

for prefixIndex in prefixIndicies {
    let length = max(prefixIndex, prefixIndex + prefix.count - suffix.count)
    let startIndex = getValidNumber(length: length, indexies: suffixIndicies)
    
    for i in startIndex..<suffixIndicies.count {
        let suffixStart = suffixIndicies[i]
        
        let end = suffixStart + suffix.count - 1
        let hashValue = getSubstrHash(start: prefixIndex, end: end)
        
        resultSet.insert(hashValue)
    }
}

print(resultSet.count)
