//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 12/10/24.
//

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init() { self.val = 0; self.left = nil; self.right = nil; }
    public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}
 
class Solution {
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        if inorder.isEmpty { return nil }
        if inorder.count == 1 { return TreeNode(inorder[0]) }
        
        let rootValue = preorder[0]
        guard let rootIndex = inorder.firstIndex(of: rootValue) else {
            return buildTree(Array(preorder[1...]), inorder)
        }
        let nextIndex = rootIndex + 1
        
        let leftArray = Array(inorder[..<rootIndex])
        let rightArray = Array(inorder[nextIndex...])
        let nextPreorder = Array(preorder[1...])
        
        let leftTree = buildTree(nextPreorder, leftArray)
        let rightTree = buildTree(nextPreorder, rightArray)
        
        return TreeNode(rootValue, leftTree, rightTree)
        
    }
}
