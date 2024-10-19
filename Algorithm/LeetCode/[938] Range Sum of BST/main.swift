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
    func rangeSumBST(_ root: TreeNode?, _ low: Int, _ high: Int) -> Int {
        guard let root else { return 0 }
        if root.val >= low && root.val <= high {
            return root.val +
            rangeSumBST(root.left, low, high) +
            rangeSumBST(root.right, low, high)
        } else if root.val < low {
            return rangeSumBST(root.right, low, high)
        } else if root.val > high {
            return rangeSumBST(root.left, low, high)
        }
        
        return 0
    }
}
