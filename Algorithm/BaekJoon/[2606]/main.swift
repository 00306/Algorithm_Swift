//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 6/21/24.
//

let n = Int(readLine()!)!
let t = Int(readLine()!)!
var network: [(Int, Int)] = []
var array: Set<Int> = [1]



var result = 0

for _ in 0..<t {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    network.append((input[0], input[1]))
}

for i in 0..<t {
    if network[i].0 == 1 {
        array.insert(network[i].1)
    } else if network[i].1 == 1 {
        array.insert(network[i].0)
    }
}

virus()

func virus() {
    
    for i in 0..<t {
        if array.contains(network[i].0), array.contains(network[i].1) { continue }
        if array.contains(network[i].0) || array.contains(network[i].1) {
            array.insert(network[i].0)
            array.insert(network[i].1)
            virus()
        }
    }
}

print(array.count - 1)
