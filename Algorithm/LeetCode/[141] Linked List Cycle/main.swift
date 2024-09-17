//
//  main.swift
//  Algorithm
//
//  Created by 송지혁 on 10/21/24.
//

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class Solution {
    func hasCycle(_ head: ListNode?) -> Bool {
        var slowNode = head
        var fastNode = head
        
        while fastNode != nil && fastNode?.next != nil {
            slowNode = slowNode?.next
            fastNode = fastNode?.next?.next
            if slowNode === fastNode { return true }
            
        }
        
        return false
    }
}
