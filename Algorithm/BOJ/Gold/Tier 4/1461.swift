//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/3/25.
//

let nm = readLine()!.split(separator: " ").map { Int($0)! }
let n = nm[0]
let m = nm[1]

let bookPositions = readLine()!.split(separator: " ").map { Int($0)! }
let maxPosition = abs(bookPositions.max(by: { abs($0) < abs($1) })!)
let positivePositions = bookPositions.filter { $0 > 0 }.sorted(by: { $0 > $1 })
let negativePositions = bookPositions.filter { $0 < 0 }.sorted(by: { $0 < $1 })

var result = 0

for i in stride(from: 0, to: positivePositions.count, by: m) {
    result += positivePositions[i] * 2
}

for i in stride(from: 0, to: negativePositions.count, by: m) {
    result -= negativePositions[i] * 2
}

print(result - maxPosition)




