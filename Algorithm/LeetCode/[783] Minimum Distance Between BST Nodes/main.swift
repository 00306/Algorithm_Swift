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
        var nums: [Int] = inorderTraversal(root)
        
        var result = Int.max
        for i in 1..<nums.count {
            result = min(result, nums[i] - nums[i-1])
        }
        
        return result
    }
    
    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let root else { return [] }
        return inorderTraversal(root.left) + [root.val] + inorderTraversal(root.right)
    }
}
