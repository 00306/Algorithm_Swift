//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 10/2/24.
//

let NM = readLine()!.split(separator: " ").map { Int($0)! }
let n = NM[0]
let m = NM[1]
let trees = readLine()!.split(separator: " ").map { Int($0)! }
let maxTree = trees.max()!

func binarySearch(_ array: [Int]) -> Int {
    var start = 0
    var end = maxTree
    
    while start <= end {
        let mid = (start + end) / 2
        var sum = 0
        
        for height in array where height > mid {
            sum += height - mid
        }
        
        if sum == m { return mid }
        else if sum > m { start = mid + 1 }
        else { end = mid - 1 }
        
    }
    
    return end
}

print(binarySearch(trees))
