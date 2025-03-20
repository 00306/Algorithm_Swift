//
//  1662.swift
//  Algorithm
//
//  Created by 송지혁 on 3/20/25.
//

let string = readLine()!.map { String($0) }
var index = 0

func recursion(index: Int) -> (endIndex: Int, count: Int) {
    var currentIndex = index
    var currentCount = 0
    
    while currentIndex < string.count {
        if string[currentIndex] == "(" {
            let repeatNumber = Int(string[currentIndex - 1])!
            let (endIndex, count) = recursion(index: currentIndex + 1)
            currentIndex = endIndex + 1
            currentCount -= 1
            currentCount += repeatNumber * count
        } else if string[currentIndex] == ")" {
            return (currentIndex, currentCount)
        } else {
            currentCount += 1
            currentIndex += 1
        }
    }
    
    return (currentIndex, currentCount)
}

let (_, count) = recursion(index: 0)
print(count)
