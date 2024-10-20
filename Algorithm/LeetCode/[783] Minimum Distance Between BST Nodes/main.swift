//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 12/14/24.
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
    func minDiffInBST(_ root: TreeNode?) -> Int {
        guard let root else { return Int.max }
        
        let leftValue = goToRight(root.left)
        let rightValue = goToLeft(root.right)
        
        let leftsubTreeMinValue = minDiffInBST(root.left)
        let rightsubTreeMinValue = minDiffInBST(root.right)
        
        return min(leftsubTreeMinValue,
                   rightsubTreeMinValue,
                   abs(root.val - leftValue),
                   abs(root.val - rightValue))
    }
    
    func goToRight(_ root: TreeNode?) -> Int {
        if root == nil { return Int.max }
        if let root, root.right == nil { return root.val }
        
        return goToRight(root?.right)
    }
    
    func goToLeft(_ root: TreeNode?) -> Int {
        if root == nil { return Int.max }
        if let root, root.left == nil { return root.val }
        
        return goToLeft(root?.left)
    }
}
