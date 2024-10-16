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
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}
 

class Solution {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        guard let root = root, let p, let q else { return nil }
        
        if root.val > p.val, root.val > q.val {
            return lowestCommonAncestor(root.left, p, q)
        }
        
        if root.val < p.val, root.val < q.val {
            return lowestCommonAncestor(root.right, p, q)
        }
        
        return root
    }
}
