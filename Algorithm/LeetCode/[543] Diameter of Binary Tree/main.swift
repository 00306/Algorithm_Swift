//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 11/12/24.
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
    func diameterOfBinaryTree(_ root: TreeNode?) -> Int {
        var diameter = 0
        
        @discardableResult
        func depth(_ node: TreeNode?) -> Int {
            guard let node = node else { return 0 }
            
            let leftDepth = depth(node.left)
            let rightDepth = depth(node.right)
            
            diameter = max(diameter, leftDepth + rightDepth)
            
            return max(leftDepth, rightDepth) + 1
        }
        
        
        depth(root)
        
        return diameter
    }
}
