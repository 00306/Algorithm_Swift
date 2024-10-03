//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 11/14/24.
//


var tree: [Int: [(child: Int, weight: Int)]] = [:]

let n = Int(readLine()!)!


for _ in 0..<n-1 {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let parent = input[0]
    let child = input[1]
    let weight = input[2]
    
    tree[parent, default: []].append( (child, weight) )
}

var result = 0

@discardableResult
func dfs(_ node: Int) -> Int {
    guard let children = tree[node] else { return 0 }
    var maxWeight = 0
    var secondWeight = 0
    
    for (child, weight) in children {
        let childWeight = dfs(child)
        let totalWeight = childWeight + weight
        
        if totalWeight > maxWeight {
            if maxWeight > secondWeight || secondWeight == 0 { secondWeight = maxWeight }
            maxWeight = totalWeight
        } else if totalWeight > secondWeight {
            secondWeight = totalWeight
        }
    }
    
    result = max(result, maxWeight + secondWeight)
    
    return maxWeight
}


dfs(1)
print(result)
