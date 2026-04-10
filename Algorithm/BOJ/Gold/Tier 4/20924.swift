//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/10/26.
//

typealias Connect = (node: Int, weight: Int)

let NR = readLine()!.split(separator: " ").map { Int($0)! }
let N = NR[0]
let R = NR[1]

var graph: [Int: [(Int, Int)]] = [:]

for _ in 0..<N-1 {
    let connect = readLine()!.split(separator: " ").map { Int($0)! }
    let firstNode = connect[0]
    let secondNode = connect[1]
    let weight = connect[2]
    
    graph[firstNode, default: []].append(Connect(secondNode, weight))
    graph[secondNode, default: []].append(Connect(firstNode, weight))
}

func findGigaNode(from root: Int) -> (Connect, Int?) {
    var queue: [(Connect, Int?)] = [(Connect(root, 0), nil)]
    var index = 0
    
    while index < queue.count {
        let currentNode = queue[index].0.node
        let currentWeight = queue[index].0.weight
        let parent = queue[index].1
        index += 1
        
        let neighbors = graph[currentNode, default: []].filter { $0.0 != parent }
        
        if neighbors.count > 1 { return ((currentNode, currentWeight), parent) }
        
        for (child, weight) in neighbors {
            if child == parent { continue }
            queue.append((Connect(child, currentWeight + weight), currentNode))
        }
    }
    
    
    return queue.last!
}



func height(from root: Int, parent: Int?) -> Int {
    let childs = graph[root, default: []].filter { $0.0 != parent }
    
    if childs.isEmpty { return 0 }
    
    var result = 0
    
    for (child, weight) in childs {
        result = max(result, height(from: child, parent: root) + weight)
    }
    
    return result
}

let (connect, parent) = findGigaNode(from: R)

let maxBranchHeight = height(from: connect.node, parent: parent)


print(connect.weight, maxBranchHeight, separator: " ")

