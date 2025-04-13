//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/13/25.
//

func findingRoot(size: Int, tree: [[Int]]) -> Int {
    var result = (2...size).reduce(1, ^)
    tree.flatMap({ $0 }).forEach { result ^= $0 }
    return result
}

let T = Int(readLine()!)!
var result = ""

for _ in 0..<T {
    let N = Int(readLine()!)!
    var tree = Array(repeating: [Int](), count: N+1)
    
    for _ in 0..<N-1 {
        let connect = readLine()!.split(separator: " ").map { Int($0)! }
        let parent = connect[0]
        let child = connect[1]
        
        tree[parent].append(child)
    }
    
    let root = findingRoot(size: N, tree: tree)
    
    let nodes = readLine()!.split(separator: " ").map { Int($0)! }
    let firstNode = nodes[0]
    let secondNode = nodes[1]
    
    result += "\(searchMostCommonAncestor(currentNode: root, firstChild: firstNode, secondChild: secondNode))\n"
    
    func searchMostCommonAncestor(currentNode: Int, firstChild: Int, secondChild: Int) -> Int {
        if currentNode == firstChild || currentNode == secondChild { return currentNode }
        
        var candidates: [Int] = []
        
        for child in tree[currentNode] {
            if searchMostCommonAncestor(currentNode: child, firstChild: firstChild, secondChild: secondChild) != 0 {
                candidates.append(child)
            }
        }
        
        if candidates.count == 1 {
            return searchMostCommonAncestor(currentNode: candidates[0], firstChild: firstChild, secondChild: secondChild)
        } else if candidates.count == 2 { return currentNode }
        else { return 0 }
    }
}


print(result)
