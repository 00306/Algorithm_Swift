//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 4/27/25.
//

let n = Int(readLine()!)!

var tree = Array(repeating: [Int](repeating: -1, count: n+1), count: n+1)
var graph = Array(repeating: [Int](), count: n+1)
var memo = Array(repeating: 0, count: n+1)
var childs = Set<Int>()

for _ in 0..<n {
    let connect = readLine()!.split(separator: " ").map { Int($0)! }
    let parent = connect[0]
    let leftChild = connect[1]
    let rightChild = connect[2]
    graph[parent].append(leftChild)
    graph[parent].append(rightChild)
    childs.insert(leftChild)
    childs.insert(rightChild)
}

var root = Set(1...n).subtracting(childs).first!

var maxLevel = root
var maxWidth = 1

func countSubTreeWidth(node: Int) -> Int {
    if node == -1 { return 0 }
    if memo[node] != 0 { return memo[node] }
    
    let leftChild = graph[node][0]
    let rightChild = graph[node][1]
    
    if leftChild == -1, rightChild == -1 {
        memo[node] = 1
        return 1
    }
    
    let leftWidth = countSubTreeWidth(node: leftChild)
    let rightWidth = countSubTreeWidth(node: rightChild)
    
    let result = leftWidth + rightWidth + 1
    memo[node] = result
    return result
}

func buildTree(currentNode: Int, currentLevel: Int, parentRow: Int, isLeft: Bool) {
    if currentNode == -1 { return }
    let leftChild = graph[currentNode][0]
    let rightChild = graph[currentNode][1]
    var currentRow = 0
    
    if isLeft {
        let rightChildWidth = rightChild == -1 ? 0 : memo[rightChild]
        currentRow = parentRow - rightChildWidth - 1
        tree[currentLevel][currentRow] = currentNode
        
    } else {
        let leftChildWidth = leftChild == -1 ? 0 : memo[leftChild]
        currentRow = parentRow + leftChildWidth + 1
        tree[currentLevel][currentRow] = currentNode
        
    }
    
    buildTree(currentNode: leftChild, currentLevel: currentLevel+1, parentRow: currentRow, isLeft: true)
    buildTree(currentNode: rightChild, currentLevel: currentLevel+1, parentRow: currentRow, isLeft: false)
}

countSubTreeWidth(node: root)
buildTree(currentNode: root, currentLevel: 1, parentRow: 0, isLeft: false)

for i in 1..<tree.count {
   let level = tree[i]
    guard let startIndex = level.firstIndex(where: { $0 != -1 }) else { continue }
    guard let lastIndex = level.lastIndex(where: { $0 != -1 }) else { continue }
    
    if lastIndex - startIndex + 1 > maxWidth {
        maxWidth = lastIndex - startIndex + 1
        maxLevel = i
    }
}

print(maxLevel, maxWidth, separator: " ")
