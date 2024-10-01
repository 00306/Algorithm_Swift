//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 11/12/24.
//


 public class Node {
     public var val: Int
     public var left: Node?
     public var right: Node?
       public var next: Node?
     public init(_ val: Int) {
         self.val = val
         self.left = nil
         self.right = nil
         self.next = nil
     }
 }
 
class Solution {
    func connect(_ root: Node?) -> Node? {
        guard let root = root else { return nil }
        var queue: [Node] = [root]
        
        while !queue.isEmpty {
            let count = queue.count
            var prev: Node? = nil
            
            for _ in 0..<count {
                let node = queue.removeFirst()
                
                if let prev = prev {
                    prev.next = node
                }
                
                prev = node
                
                if let left = node.left {
                    queue.append(left)
                }
                
                if let right = node.right {
                    queue.append(right)
                }
            }
            prev?.next = nil
        }
        
        
        return root
    }
}
