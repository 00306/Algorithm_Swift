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
    func isValidBST(_ root: TreeNode?) -> Bool { validate(root, low: nil, high: nil) }
    
    func validate(_ root: TreeNode?, low: Int?, high: Int?) -> Bool {
        guard let root = root else { return true }
        
        if let low = low, root.val <= low { return false }
        if let high = high, root.val >= high { return false }
        
        return validate(root.left, low: low, high: root.val) &&
        validate(root.right, low: root.val, high: high)
    }
}
