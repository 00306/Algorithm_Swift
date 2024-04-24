//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/24/24.
//

let n = Int(readLine()!)!
let coordinates_arr = readLine()!.split(separator: " ").map { Int($0)! }
var coordinates_dict: [Int: Int] = [:]

func quickSort(_ array: [Int]) -> [Int] {
    guard let first = array.first, array.count > 1 else { return array }
    
    let pivot = first
    let left = array.filter { $0 < pivot }
    let right = array.filter { $0 > pivot }
    
    return quickSort(left) + [pivot] + quickSort(right)
}

let sorted_arr = quickSort(coordinates_arr)

var next = 0

for num in sorted_arr {
    if coordinates_dict[num] == nil {
        coordinates_dict[num] = next
        next += 1
    }
}

print(coordinates_arr.map { String(coordinates_dict[$0]!)}.joined(separator: " ") )
// coordinates_arr.forEach { print(coordinates_dict[$0]!, terminator: " ")}
