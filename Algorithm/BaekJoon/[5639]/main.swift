//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 12/10/24.
//

class Node {
    let value: Int
    var leftChild: Node?
    var rightChild: Node?
    
    init(value: Int, leftChild: Node? = nil, rightChild: Node? = nil) {
        self.value = value
        self.leftChild = leftChild
        self.rightChild = rightChild
    }
}

var preorder: [Int] = []

while let input = readLine(), let number = Int(input) {
    preorder.append(number)
}

func buildTree(preorder: [Int]) -> Node? {
    guard let rootValue = preorder.first else { return nil }
    if preorder.count == 1 { return Node(value: rootValue) }
    guard let rightStartIndex = preorder.firstIndex(where: { $0 > rootValue }) else {
        return Node(value: rootValue, leftChild: buildTree(preorder: Array(preorder[1...])))
    }
    
    let leftArray = Array(preorder[1..<rightStartIndex])
    let rightArray = Array(preorder[rightStartIndex...])
    
    let leftTree = buildTree(preorder: leftArray)
    let rightTree = buildTree(preorder: rightArray)
    
    return Node(value: rootValue, leftChild: leftTree, rightChild: rightTree)
    
}

let root = buildTree(preorder: preorder)

func postorderTraversal(_ tree: Node?) {
    if let tree = tree {
        if let leftChild = tree.leftChild { postorderTraversal(leftChild) }
        if let rightChild = tree.rightChild { postorderTraversal(rightChild) }
        print(tree.value)
    }
}

postorderTraversal(root)
