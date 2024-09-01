//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 9/30/24.
//

let KN = readLine()!.split(separator: " ").map { Int($0)! }
let k = KN[0]
let n = KN[1]
var numbers: [Int] = []


for _ in 0..<k {
    numbers.append(Int(readLine()!)!)
}

let maxNum = numbers.max()!

func checkLensCount(_ num: Int) -> Bool {
    let count = numbers.map { $0 / num }.reduce(0, +)
    return count >= n
}

func binarySearch(_ array: [Int]) -> Int {
    var start = 1
    var end = maxNum
    
    while start <= end {
        let mid = (start + end) / 2
        if checkLensCount(mid) {
            start = mid + 1
        } else { end = mid - 1 }
        
    }
    
    return end
}

print(binarySearch(numbers))
