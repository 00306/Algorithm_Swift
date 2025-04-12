//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/12/25.
//

class Node {
    let value: Int
    var childNode: [Node]
    
    init(value: Int, childNode: [Node] = []) {
        self.value = value
        self.childNode = childNode
    }
}

let NRQ = readLine()!.split(separator: " ").map { Int($0)! }
let N = NRQ[0]
let R = NRQ[1]
let Q = NRQ[2]

var graph: [Int: [Int]] = [:]
var nodeDict: [Int: Node] = [:]
var dp = Array(repeating: -1, count: N+1)

for _ in 0..<N-1 {
    let connect = readLine()!.split(separator: " ").map { Int($0)! }
    let parent = connect[0]
    let child = connect[1]
    
    graph[parent, default: []].append(child)
    graph[child, default: []].append(parent)
}

func makeTree(currentNode: Node, parentNode: Node) {
    for child in graph[currentNode.value, default: []] {
        if child != parentNode.value {
            let childNode = Node(value: child)
            currentNode.childNode.append(childNode)
            nodeDict[child] = childNode
            makeTree(currentNode: childNode, parentNode: currentNode)
        }
    }
}

func countSubtreeNode(currentNode: Node) -> Int {
    if dp[currentNode.value] != -1 { return dp[currentNode.value] }
    
    var size = 1
    
    for child in currentNode.childNode {
        size += countSubtreeNode(currentNode: child)
    }
    
    dp[currentNode.value] = size
    return size
}

var result = ""

let root = Node(value: R)
nodeDict[R] = root
makeTree(currentNode: root, parentNode: root)

for _ in 0..<Q {
    let query = Int(readLine()!)!
    let subTreeRootNode = nodeDict[query]!
    result += "\(countSubtreeNode(currentNode: subTreeRootNode))\n"
}

print(result)


