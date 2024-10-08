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
    var result = ""
    
    @discardableResult
    func tree2str(_ root: TreeNode?) -> String {
        guard let root = root else { return result }
        result += "\(root.val)"
        
        if root.left == nil, root.right == nil { return result }
        
        result += "("
        tree2str(root.left)
        result += ")"
        
        if root.right != nil {
            result += "("
            tree2str(root.right)
            result += ")"
        }
        
        
        return result
    }
    
    
}
