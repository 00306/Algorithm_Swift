//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 11/11/24.
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
    func pathSum(_ root: TreeNode?, _ targetSum: Int) -> [[Int]] {
        guard let root = root else { return [] }
        
        return preorderTraversal(root, pathNums: [root.val], targetSum: targetSum)
    }
    
    func preorderTraversal(_ current: TreeNode?, pathNums: [Int], targetSum: Int) -> [[Int]] {
        guard let current = current else { return [] }
        if current.left == nil,
           current.right == nil,
           pathNums.reduce(0, +) == targetSum { return [pathNums] }
        
        
        let leftNums: [Int] = current.left?.val != nil ? [current.left!.val] : []
        let rightNums: [Int] = current.right?.val != nil ? [current.right!.val] : []
        
        
        let left = preorderTraversal(
            current.left,
            pathNums: pathNums + leftNums,
            targetSum: targetSum)
        
        let right = preorderTraversal(
            current.right,
            pathNums: pathNums + rightNums,
            targetSum: targetSum)
        
        return left + right
    }
}
