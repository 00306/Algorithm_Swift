//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 11/11/24.
//

import Foundation

class Node {
    var value: Character
    var left: Node?
    var right: Node?
    
    init(value: Character, left: Node? = nil, right: Node? = nil) {
        self.value = value
        self.left = left
        self.right = right
    }
}

class BinaryTree {
    var root: Node?
    
    func insert(value: Character, left: Character, right: Character) {
        if root == nil { root = Node(value: value) }
        
        addRecursively(current: root, value: value, left: left, right: right)
    }
    
    private func addRecursively(current: Node?, value: Character, left: Character, right: Character) {
        guard let current = current else { return }
        
        if current.value == value {
            if left != "." {
                current.left = Node(value: left)
            }
            
            if right != "." {
                current.right = Node(value: right)
            }
        } else {
            addRecursively(current: current.left, value: value, left: left, right: right)
            addRecursively(current: current.right, value: value, left: left, right: right)
        }
    }
    
    func preorderTraversal(node: Node?) -> String {
        guard let node = node else { return "" }
        return "\(node.value)" + preorderTraversal(node: node.left) + preorderTraversal(node: node.right)
    }
    
    func inorderTraversal(node: Node?) -> String {
        guard let node = node else { return "" }
        return inorderTraversal(node: node.left) + "\(node.value)" + inorderTraversal(node: node.right)
    }
    
    func postorderTraversal(node: Node?) -> String {
        guard let node = node else { return "" }
        return postorderTraversal(node: node.left) + postorderTraversal(node: node.right) + "\(node.value)"
    }
    
    func getRoot() -> Node? { return root }

}


let n = Int(readLine()!)!
let tree = BinaryTree()

for _ in 0..<n {
    let nodes = readLine()!.split(separator: " ").map { Character(String($0)) }
    let root = nodes[0]
    let left = nodes[1]
    let right = nodes[2]
    
    tree.insert(value: root, left: left, right: right)
}

if let root = tree.getRoot() {
    print(tree.preorderTraversal(node: root))
    print(tree.inorderTraversal(node: root))
    print(tree.postorderTraversal(node: root))
}
