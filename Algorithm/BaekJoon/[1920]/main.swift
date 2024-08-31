//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 9/30/24.
//

let n = Int(readLine()!)!
let A = readLine()!.split(separator: " ").map { Int($0)! }.sorted()
let m = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").map { Int($0)! }
var result = ""


func binarySearch(_ array: [Int], finding: Int) -> Int {
    var start = 0
    var end = array.count - 1
    
    while start <= end {
        let mid = (start + end) / 2
        
        if array[mid] == finding { return 1 }
        if array[mid] > finding { end = mid - 1 }
        else { start = mid + 1 }
    }
    
    return 0
}


for num in numbers {
    result += "\(binarySearch(A, finding: num))\n"
}

print(result)

